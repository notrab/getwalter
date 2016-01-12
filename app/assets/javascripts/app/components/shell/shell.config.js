(function() {
  'use strict';

  angular
    .module('walterApp.shell')
    .config(ShellConfig)
  ;

  ShellConfig.$inject = ['$urlRouterProvider', 'cfpLoadingBarProvider'];
  function ShellConfig ($urlRouterProvider, cfpLoadingBarProvider) {
    $urlRouterProvider.otherwise('dashboard');
    cfpLoadingBarProvider.latencyThreshold = 500;
  }
})();
