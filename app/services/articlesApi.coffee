noteBook.service "articlesApi", ($resource)->
  console.log "create service"
  $resource "/api/articles/:article/:id", {}
  ,
  getArticles: # GET /api/articles
    method: "GET"
    isArray: true

  postArticle: # GET /api/articles
    method: "POST"
    isArray: false
    params:
      article: "@article"

  deleteArticle: # DELETE /api/articles/id
    method: "DELETE"
    isArray: false
    params:
      id: "@id"
