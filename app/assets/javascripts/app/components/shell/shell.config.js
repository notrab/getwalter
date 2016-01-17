(function() {
  'use strict';

  angular
    .module('walterApp.shell')
    .config(ShellConfig)
  ;

  ShellConfig.$inject = ['$urlRouterProvider', '$httpProvider', '$stateProvider', 'cfpLoadingBarProvider'];
  function ShellConfig ($urlRouterProvider, $httpProvider, $stateProvider, cfpLoadingBarProvider) {
    $urlRouterProvider.otherwise('/');
    cfpLoadingBarProvider.includeSpinner = false;
  }
})();
