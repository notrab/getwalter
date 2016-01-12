(function() {
  'use strict';

  angular
    .module('walterApp.form.new')
    .controller('NewFormController', NewFormController)
  ;

  NewFormController.$inject = ['Form', '$log'];
  function NewFormController (Form, $log) {
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
        Form.save(vm.formData, function () {
          $state.go('dashboard', {}, { reload: true });
        }, function () {
          $log.error('Something went wrong.');
        });
      }
    }
  }
})();
