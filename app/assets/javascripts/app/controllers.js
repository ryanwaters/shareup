angular.module('myApp.controllers', [])
.controller('HomeController', 
  function($scope, ArticleService) {
    $scope.articles = ArticleService.getLatestFeed();
});