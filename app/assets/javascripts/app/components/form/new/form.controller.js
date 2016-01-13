(function() {
  'use strict';

  angular
    .module('walterApp.form.new')
    .controller('NewFormController', NewFormController)
  ;

  NewFormController.$inject = ['Form', '$log', '$scope', '$state'];
  function NewFormController (Form, $log, $scope, $state) {
    var vm = this;
    vm.formData = {
      optional_notification_emails: []
    };

    // Create a directive for this
    vm.newOptionalEmail = null;
    vm.addOptionalEmail = function (isValid) {
      if (isValid) {
        vm.formData.optional_notification_emails.push(vm.newOptionalEmail);
        vm.newOptionalEmail = null;
      }
    }
    vm.removeOptionalEmail = function (email) {
      var index = vm.formData.optional_notification_emails.indexOf(email);
      vm.formData.optional_notification_emails.splice(index, 1);
    }

    vm.createForm = function (isValid) {
      if (isValid) {
        Form.save(vm.formData, function (data) {
          $scope.newForm.$setPristine();
          $state.go('form.show', {id: data.form.id}, {});
        }, function (error) {
          $log.error(error.message);
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
