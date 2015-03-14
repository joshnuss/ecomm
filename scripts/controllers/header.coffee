angular
 .module('ecomm')
 .controller 'HeaderController', ($scope, $mdSidenav) ->
    $scope.openLeftMenu = ->
      $mdSidenav('left').toggle()

    $scope.openRightMenu = ->
      $mdSidenav('right').toggle()
