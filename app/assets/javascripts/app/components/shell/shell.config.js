(function() {
  'use strict';

  angular
    .module('walterApp.shell')
    .config(ShellConfig)
  ;

  ShellConfig.$inject = ['$urlRouterProvider', '$httpProvider', '$stateProvider', 'cfpLoadingBarProvider'];
  function ShellConfig ($urlRouterProvider, $httpProvider, $stateProvider, cfpLoadingBarProvider) {
    $urlRouterProvider.otherwise('/');
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
    cfpLoadingBarProvider.includeSpinner = false;
  }
})();
