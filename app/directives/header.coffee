angular.module("noteBook").directive "notebookHeader", ($location)->
  restrict: "E"
  replace: true
  templateUrl: "/app/templates/directives/header.html"

  link: ($scope, $element, $attrs)->
    console.log "header dirrective"

    $scope.logIn = ->
      loginForm = $element.findChildrenByClassName("modal")
      $(loginForm).modal("hide")
      return
