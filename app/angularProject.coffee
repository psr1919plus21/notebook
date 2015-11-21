window.noteBook = angular.module("noteBook", ['ngRoute'])
  .config ($routeProvider, $locationProvider)->
    $routeProvider
      .when "/",
        templateUrl: "/notebook/app/templates/home.html"
        controller: "homeCtrl"

      .when "/anotherUrl",
        templateUrl: "/notebook/app/templates/another.html"
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
    