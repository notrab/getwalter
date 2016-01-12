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
        templateUrl: 'assets/app/components/dashboard/dashboard',
        controller: 'DashboardController',
        controllerAs: 'dash',
        data: {
          pageTitle: 'Dashboard'
        }
      })
    ;
  }
})();
