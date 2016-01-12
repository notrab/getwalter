(function() {
  'use strict';

  angular
    .module('walterApp.form.new')
    .controller('NewFormController', NewFormController)
  ;

  function NewFormController () {
    var vm = this;
    vm.formData = {};

    vm.optionalEmails = [];
    vm.newOptionalEmail = null;
    vm.addOptionalEmail = function (isValid) {
      if (isValid) {
        vm.optionalEmails.push(vm.newOptionalEmail);
        vm.newOptionalEmail = null;
      }
    }

    vm.createForm = function (isValid) {
      if (isValid) {
        console.log(vm.formData);
      }
    }
  }
})();
