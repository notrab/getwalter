(function() {
  'use strict';

  angular
    .module('walterApp.dashboard')
    .controller('DashboardController', DashboardController)
  ;

  function DashboardController () {
    var vm = this;
    vm.message = 'Hello Jamie';
  }
})();
