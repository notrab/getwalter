(function() {
  'use strict';

  angular
    .module('walterApp.form.edit')
    .controller('EditFormController', EditFormController)
  ;

  EditFormController.$inject = ['Form', '$log', '$stateParams', '$state'];
  function EditFormController (Form, $log, $stateParams, $state) {
    var vm = this;

    vm.formData = {};

    Form.get({
      id: $stateParams.id
    }, function (data) {
      vm.formData = data;
    });

    vm.updateForm = function (isValid) {
      if (isValid) {
        Form.update({id: vm.formData.id}, vm.formData);
        $state.go('forms.show', {id: vm.formData.id}, {});

        // Form.update(vm.formData, function (data) {
        //   $scope.newForm.$setPristine();
        //   $state.go('form.show', {id: vm.formData.id}, {});
        // }, function (error) {
        //   $log.error(error.message);
        // });
      }
    }
  }
})();
