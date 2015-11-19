window.angularProject = angular.module("angularProject", ['ngRoute'])
  .config ($routeProvider, $locationProvider)->
  	$routeProvider
  	  .when "/",
  	    templateUrl: "/notebook/app/templates/home.html"
  	    controller: "homeCtrl"

  	  .when "/anotherUrl",
  	    templateUrl: "/notebook/app/templates/another.html"
  	    controller: "anotherCtrl"

  	  .otherwise {redirectTo: "/"}

  	