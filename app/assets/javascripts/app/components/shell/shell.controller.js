(function() {
  'use strict';

  angular
    .module('walterApp.shell')
    .controller('ShellController', ShellController)
  ;

  ShellController.$inject = ['$scope', '$rootScope', '$location', '$state', '$http', 'Auth', 'CurrentUser'];
  function ShellController ($scope, $rootScope, $location, $state, $http, Auth, CurrentUser) {
    $scope.currentUser = {};

    $rootScope.$on('$stateChangeSuccess', function (event, toState) {
      if (!Auth.authorize(toState.data.access)) {
        event.preventDefault();
        $state.go('guest.login');
      }

      if (angular.isDefined(toState.data.pageTitle)) {
        $rootScope.pageTitle = toState.data.pageTitle;
      }
    });

    $scope.auth = Auth;
    $scope.currentUser = CurrentUser;

    $rootScope.logout = function() {
      Auth.logout();
      $state.go('guest.home');
    };

    $rootScope.isLoggedIn = function () {
      return Auth.isAuthenticated();
    };
  }
})();
