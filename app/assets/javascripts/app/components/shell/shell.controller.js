(function() {
  'use strict';

  angular
    .module('walterApp.shell')
    .controller('ShellController', ShellController)
  ;

  ShellController.$inject = ['$scope', '$location', '$state', '$http'];
  function ShellController ($scope, $location, $state, $http) {
    $scope.$on('$stateChangeSuccess', function (event, toState) {
      if (angular.isDefined(toState.data.pageTitle)) {
        $scope.pageTitle = toState.data.pageTitle;
      }
    });

    $http.get('/api/users/me', {
      ignoreLoadingBar: true
    }).then(function(user) {
      $scope.currentUser = user.data;
    });
  }
})();
