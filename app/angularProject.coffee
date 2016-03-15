window.noteBook = angular.module("noteBook", ['ngRoute', 'ngResource'])
  .config ($routeProvider, $locationProvider)->
    $locationProvider.html5Mode
     enabled: true,
     requireBase: false

    $routeProvider
      .when "/",
        templateUrl: "/app/templates/home.html"
        controller: "homeCtrl"

      .when "/anotherUrl",
        templateUrl: "/app/templates/another.html"
        controller: "anotherCtrl"

      .otherwise {redirectTo: "/"}

angular.element.prototype.closest = (parentClass)->
  $this = this
  closestElement = undefined
  while $this.parent()
    if $this.parent().hasClass parentClass
      closestElement = $this.parent()
      break
    $this = $this.parent()
  closestElement

angular.element.prototype.findChildrenByClassName = (childrenClass)->
  $this = this
  childElement = undefined
  childNodes = Array.prototype.slice.call $this[0].childNodes
  childNodes.forEach (children)->
    if children.nodeType != 3 and angular.element(children).hasClass childrenClass
      childElement = children
  childElement

