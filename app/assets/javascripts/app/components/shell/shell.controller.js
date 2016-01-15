(function() {
  'use strict';

  angular
    .module('walterApp.shell')
    .controller('ShellController', ShellController)
  ;

  ShellController.$inject = ['$rootScope', '$location', '$state', '$http'];
  function ShellController ($rootScope, $location, $state, $http) {
    $rootScope.$on('$stateChangeSuccess', function (event, toState) {
      if (angular.isDefined(toState.data.pageTitle)) {
        $rootScope.pageTitle = toState.data.pageTitle;
      }
    });

    $http.get('/api/users/me', {
      ignoreLoadingBar: true
    }).then(function(user) {
      $rootScope.currentUser = user.data;
    });
  }
})();
