(function() {
  'use strict';

  angular
    .module('walterApp.dashboard')
    .controller('DashboardController', DashboardController)
  ;

  DashboardController.$inject = ['Form', 'resA'];
  function DashboardController (Form, resA) {
    var vm = this;
    console.log(resA.value);
  }
})();
