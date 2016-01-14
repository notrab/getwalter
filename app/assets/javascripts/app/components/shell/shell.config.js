(function() {
  'use strict';

  angular
    .module('walterApp.shell')
    .config(ShellConfig)
  ;

  ShellConfig.$inject = ['$urlRouterProvider', '$httpProvider', '$stateProvider'];
  function ShellConfig ($urlRouterProvider, $httpProvider, $stateProvider) {
    $urlRouterProvider.otherwise('/');
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
  }
})();
