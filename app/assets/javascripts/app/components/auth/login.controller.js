(function() {
  'use strict';

  angular
    .module('walterApp.auth')
    .controller('LoginController', LoginController)
  ;

  LoginController.$inject = ['$state', Auth];
  function LoginController ($state, Auth) {
    var vm = this;
    vm.errors = [];

    vm.login = function() {
      if (vm.loginForm.$valid) {
        vm.errors = [];
        Auth.login(vm.user).success(function(result) {
          $state.go('dashboard.list');
        }).error(function(err) {
          vm.errors.push(err);
        });
      }
    };
  });
})();
