(function() {
  'use strict';

  angular
    .module('walterApp.shell')
    .controller('ShellController', ShellController)
  ;

  ShellController.$inject = ['$scope', '$rootScope', '$location', '$state', '$http'];
  function ShellController ($scope, $rootScope, $location, $state, $http) {
    $scope.currentUser = {};

    $rootScope.$on('$stateChangeSuccess', function (event, toState) {
      if (angular.isDefined(toState.data.pageTitle)) {
        $rootScope.pageTitle = toState.data.pageTitle;
      }
    });

    $http.get('/api/users/me', {
      ignoreLoadingBar: true
    }).then(function(user) {
      $scope.currentUser = user.data;
    });

    $scope.logout = function () {
      $scope.currentUser = null;
      // $cookieStore.remove('loggedIn');
      $state.go('/');
    }

    $scope.isLoggedIn = function () {
      // return true;
    }
  }
})();
