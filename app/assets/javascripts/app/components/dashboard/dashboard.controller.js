(function() {
  'use strict';

  angular
    .module('walterApp.dashboard')
    .controller('DashboardController', DashboardController)
  ;

  DashboardController.$inject = ['Form'];
  function DashboardController (Form) {
    var vm = this;
    vm.message = 'Hello Jamie';

    Form.query({}, function (forms) {
      vm.forms = forms;
    });
  }
})();
