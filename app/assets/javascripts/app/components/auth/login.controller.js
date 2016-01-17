(function() {
  'use strict';

  angular.module('walterApp')
    .controller('LoginController', function($scope, $state, Auth) {
      $scope.errors = [];

      $scope.login = function() {
        if ($scope.loginForm.$valid) {
          $scope.errors = [];
          Auth.login($scope.user).success(function(result) {
            $state.go('dashboard.list');
          }).error(function(err) {
            $scope.errors.push(err);
          });
        }
      };
    });
})();
