(function() {
  'use strict';

  angular
    .module('walterApp.shell')
    .controller('ShellController', ShellController)
  ;

  ShellController.$inject = ['$scope', '$location', '$state'];
  function ShellController ($scope, $location, $state) {
    $scope.$on('$stateChangeSuccess', function (event, toState) {
      if (angular.isDefined(toState.data.pageTitle)) {
        $scope.pageTitle = toState.data.pageTitle;
      }
    });
  }
})();
