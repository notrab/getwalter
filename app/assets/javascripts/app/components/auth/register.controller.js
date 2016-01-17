(function() {
  'use strict';

  angular.module('walterApp')
    .controller('RegisterController', function($scope, $state, Auth) {
      $scope.register = function() {
        Auth.register($scope.user).then(function() {
          $state.go('dashboard.list');
        });
      };
    });
})();
