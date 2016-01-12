(function() {
  'use strict';

  angular
    .module('walterApp.dashboard')
    .controller('DashboardController', DashboardController)
  ;

  DashboardController.$inject = ['Event'];
  function DashboardController (Event) {
    var vm = this;
    vm.message = 'Hello Jamie';
    vm.forms = Event
  }
})();
