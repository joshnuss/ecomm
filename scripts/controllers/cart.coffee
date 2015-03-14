angular.module('ecomm')
 .controller 'CartController', ($scope, $mdSidenav) ->
    $scope.items = [
      {
        name: "T-Shirt"
        price: 10.99
      }
      {
        name: "Pants"
        price: 12.99
      }
    ]
