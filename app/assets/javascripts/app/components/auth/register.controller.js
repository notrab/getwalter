(function() {
  'use strict';

  angular
    .module('walterApp.auth')
    .controller('RegisterController', RegisterController)
  ;


  RegisterController.$inject = ['$state', 'Auth'];
  function RegisterController ($state, Auth) {
    var vm = this;

    vm.register = function() {
      Auth.register(vm.user).then(function() {
        $state.go('dashboard.list');
      });
    };
  });
})();
