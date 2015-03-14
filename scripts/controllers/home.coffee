angular.module('ecomm')
 .controller 'HomeController', ($scope) ->
    $scope.slides = [
      {
        name: "T-Shirt"
        price: 10.99
      }
      {
        name: "Pants"
        price: 12.99
      }
    ]
