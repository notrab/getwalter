(function() {
  'use strict';

  angular
    .module('walterApp.dashboard')
    .config(DashboardConfig)
  ;

  DashboardConfig.$inject = ['$stateProvider'];
  function DashboardConfig ($stateProvider) {
    $stateProvider
      .state('dashboard', {
        url: '/dashboard',
        template: '{{dash.message}}',
        controller: 'DashboardController',
        controllerAs: 'dash',
        data: {
          pageTitle: 'Dashboard'
        }
      })
    ;
  }
})();
