window.angularProject = angular.module("angularProject", ['ngRoute'])
  .config ($routeProvider, $locationProvider)->
  	$routeProvider
  	  .when "/",
  	    templateUrl: "/angularjs_project/app/templates/home.html"
  	    controller: "homeCtrl"

  	  .when "/anotherUrl",
  	    templateUrl: "/angularjs_project/app/templates/another.html"
  	    controller: "anotherCtrl"

  	  .otherwise {redirectTo: "/"}

  	