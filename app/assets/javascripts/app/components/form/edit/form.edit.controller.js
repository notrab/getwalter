(function() {
  'use strict';

  angular
    .module('walterApp.form.edit')
    .controller('EditFormController', EditFormController)
  ;

  EditFormController.$inject = ['Form', '$rootScope', '$stateParams', '$state', 'formRes'];
  function EditFormController (Form, $rootScope, $stateParams, $state, formRes) {
    var vm = this;
    vm.formData = formRes;

    $rootScope.pageTitle = "Editing " + vm.formData.name;

    vm.updateForm = function (isValid) {
      if (isValid) {
        Form.update({id: vm.formData.id}, vm.formData);
        $state.go('forms.show', {id: vm.formData.id}, {});
      }
    }
  }
})();
