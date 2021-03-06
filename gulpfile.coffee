gulp       = require("gulp")
concat     = require("gulp-concat")
sass       = require("gulp-ruby-sass")
minifyCss  = require("gulp-minify-css")
rename     = require("gulp-rename")
coffee     = require("gulp-coffee")
sourcemaps = require("gulp-sourcemaps")
jade       = require("gulp-jade")
notify     = require("gulp-notify")
addsrc     = require('gulp-add-src')

paths =
  sass:
    source: "sass"
    dest: './www/css'
    includes: [
      "bower_components/angular-material/angular-material.css"
    ]
  coffee:
    source: ["scripts/**/*.coffee"]
    target: "app.js"
    dest: './www/js'
  javascript:
    includes: [
      'bower_components/angular/angular.js'
      'bower_components/angular-animate/angular-animate.js'
      'bower_components/angular-aria/angular-aria.js'
      'bower_components/angular-material/angular-material.js'
    ]
  templates:
    source: ["views/**/*.jade"]
    locals: {}
    dest: './www'

gulp.task "default", ["sass", "coffee", "templates"]

gulp.task "templates", ->
  gulp.src(paths.templates.source)
      .pipe(jade(locals: paths.templates.locals))
      .on("error", notify.onError("Error: <%= error.message %>"))
      .pipe(gulp.dest(paths.templates.dest))
      .pipe(notify(message: ".html files updated"))

gulp.task "coffee", (done) ->
  gulp.src(paths.coffee.source)
      .pipe(sourcemaps.init())
      .pipe(coffee())
      .on("error", notify.onError("Error: <%= error.message %>"))
      .pipe(addsrc.prepend(paths.javascript.includes))
      .pipe(concat(paths.coffee.target))
      .pipe(sourcemaps.write())
      .pipe(gulp.dest(paths.coffee.dest))
      .pipe(notify(message: ".js files updated"))

gulp.task "sass", (done) ->
  sass(paths.sass.source)
      .on("error", notify.onError("Error: <%= error.message %>"))
      .pipe(addsrc.prepend(paths.sass.includes))
      .pipe(gulp.dest(paths.sass.dest))
      .pipe(minifyCss(keepSpecialComments: 0))
      .pipe(rename(extname: ".min.css"))
      .pipe(gulp.dest(paths.sass.dest))
      .pipe(notify(message: ".css files updated"))

gulp.task "watch", ->
  gulp.start("default")

  gulp.watch paths.sass.source, ->
    gulp.start("sass")

  gulp.watch paths.coffee.source, ->
    gulp.start("coffee")

  gulp.watch paths.templates.source, ->
    gulp.start("templates")
