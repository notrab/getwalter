(function() {
  'use strict';

  angular
    .module('walterApp.dashboard')
    .controller('DashboardController', DashboardController)
  ;

  DashboardController.$inject = ['Form'];
  function DashboardController (Form) {
    var vm = this;

    Form.query({}, function (forms) {
      vm.forms = forms;
    });
  }
})();
