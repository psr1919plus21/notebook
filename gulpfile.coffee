gulp = require("gulp")
coffee = require("gulp-coffee")
concat = require('gulp-concat')
watch = require("gulp-watch")
sass = require("gulp-sass")
autoprefixer = require("gulp-autoprefixer")

# Define path object
path =
	src:
		coffee: "./app/**/*.coffee"
		sass: "./static/sass/*.scss"
		fonts: "./static/fonts/*"
		img: "./static/img/*"
	dist:
		js: "./build/js/"
		coffee: "./build/coffee/"
		css: "./build/css/"
		fonts: "./build/fonts/"
		img: "./build/img/"
		
# Concat vendors js files in 'vendors.js'
gulp.task "vendors", ->
	gulp.src [
		"node_modules/angular/angular.min.js"	
		"node_modules/angular-route/angular-route.min.js"	
		# Insert path to vendors js here.
	]
	.pipe(concat "vendors.js")
	.pipe gulp.dest path.dist.js

# Replace fonts to "./build/fonts/"
gulp.task "fonts", ->
	gulp.src(path.src.fonts)
	.pipe gulp.dest path.dist.fonts

# Concat all coffee from app to "./build/coffee/"
gulp.task "coffeeConcat", ->
	gulp.src(path.src.coffee)
	.pipe(concat "angularProject.all.coffee")
	.pipe gulp.dest path.dist.coffee

# Compile angularProject.all.coffee to "./build/js/angularProject.all.js"
gulp.task "coffee", ["coffeeConcat"], ->
	gulp.src "./build/coffee/angularProject.all.coffee"
	.pipe(do coffee)
	.pipe gulp.dest path.dist.js

# Compile angularProject.scss to "./build/css/angularProject.css"
gulp.task "sass", ->
	gulp.src(path.src.sass)
	.pipe(do sass)
	.pipe gulp.dest path.dist.css

# Insert vendor prefixes in "./build/css/*.css"
gulp.task "autoprefixer", ["sass"], ->
	gulp.src("./build/css/*.css")
	.pipe(do autoprefixer)
	.pipe gulp.dest path.dist.css

# Watch for changes
gulp.task "watch", ->
	watch path.src.coffee, ->
		gulp.run "coffee"
	watch path.src.sass, ->
		gulp.run "autoprefixer"
	
# Compile static
gulp.task "default", ["vendors",  "autoprefixer", "fonts", "coffee"], ->

# Compile static and watch
gulp.task "dev", ["vendors",  "autoprefixer", "fonts", "coffee", "watch"], ->