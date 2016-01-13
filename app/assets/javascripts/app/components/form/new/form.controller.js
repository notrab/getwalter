(function() {
  'use strict';

  angular
    .module('walterApp.form.new')
    .controller('NewFormController', NewFormController)
  ;

  NewFormController.$inject = ['Form', '$log', '$scope'];
  function NewFormController (Form, $log, $scope) {
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

    var $locationChangeStartUnbind = $scope.$on('$stateChangeStart', function (event, toState, toParams, fromState, fromParams) {
      if ($scope.newForm.$dirty) {
        if (!confirm("Are you sure you wish to discard changes to your uncompleted form?")) {
          event.preventDefault();
        }
      }
    });

    $scope.$on('$destroy', function () {
      window.onbeforeunload = null;
      $locationChangeStartUnbind();
    });
  }
})();
