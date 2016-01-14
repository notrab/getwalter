(function() {
  'use strict';

  angular
    .module('walterApp.dashboard')
    .controller('DashboardController', DashboardController)
  ;

  DashboardController.$inject = ['Form'];
  function DashboardController (Form) {
    var vm = this;
  }
})();
