var express = require("express");
var path = require("path");
var morgan = require('morgan');
var log = require("../libs/log.js")(module);
var config = require("../libs/config.js");
var bodyParser = require('body-parser');


// Create app.
var app = express();

// App presets.
app.use(morgan("combined"));
app.use(bodyParser.json());
app.use(express.static(path.join(__dirname, "../")));

// routing.
app.get("/api", function(req, res){
  res.send("API is runing.");
});

app.get("/error", function(req, res, next){
  next(new Error("Random error."));
});

// CRUD
var ArticleModel = require("../libs/mongoose").ArticleModel;

app.get('/api/articles', function(req, res) {
  return ArticleModel.find(function (err, articles) {
      if (!err) {
          return res.send(articles);
      } else {
          res.statusCode = 500;
          log.error('Internal error(%d): %s',res.statusCode,err.message);
          return res.send({ error: 'Server error' });
      }
  });
});

app.post('/api/articles', function(req, res) {

  console.log("req.body");
  console.log(req.body);
  var article = new ArticleModel({
    title: req.body.title,
    author: req.body.author,
    note: req.body.note,
    images: req.body.images
  });

  article.save(function(err, obj){
    log.info("IIIIDDDD: " + obj._id);
    if (!err){
      return res.send({status: "OK", article: article, id: obj._id});
    } else {
      console.log(err);
      if(err.name == 'ValidationError') {
          res.statusCode = 400;
          res.send({ error: 'Validation error' });
      } else {
          res.statusCode = 500;
          res.send({ error: 'Server error' });
      }
      log.error('Internal error(%d): %s',res.statusCode,err.message);
    }
  });

});

app.get('/api/articles/:id', function(req, res) {
    res.send('This is not implemented now');
});

app.put('/api/articles/:id', function (req, res){
    res.send('This is not implemented now');
});

app.delete('/api/articles/:id', function (req, res){
  return ArticleModel.findById(req.params.id, function(err, article) {
    if (!article) {
      res.statusCode = 404;
      return res.send({error: 'Not found.'});
    }

    return article.remove(function(err){
      if (!err) {
        log.info('Article removed.');
        res.send({status: 'OK. Article removed.'});
      } else {
        res.statusCode = 500;
        log.error('Internal error(%d): %s', res.statusCode, err.message);
        return res.send({error: 'Server error'});
      }
    });
  });

});

// 404.
app.use(function(req, res, next){
  res.status(404);
  log.debug("Not found url: %s", req.url);
  res.send({error: "Not found."});
  return;
});

// 500.
app.use(function(err, req, res, next){
  res.status(err.status || 500);
  log.error("Internal error(%d) %s", res.statusCode, err.message);
  res.send({error: err.message});
  return;
});


app.listen(config.get("port"), function(){
  log.info("express lictening port: " + config.get("port"));
});
