(function() {
  'use strict';

  angular
    .module('walterApp.account')
    .controller('AccountController', AccountController)
  ;

  AccountController.$inject = ['Form'];
  function AccountController (Form) {
    var vm = this;
  }
})();
