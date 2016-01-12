(function() {
  'use strict';

  angular
    .module('walterApp.shell')
    .config(ShellConfig)
  ;

  ShellConfig.$inject = ['$urlRouterProvider', '$httpProvider'];
  function ShellConfig ($urlRouterProvider, $httpProvider) {
    $urlRouterProvider.otherwise('dashboard');
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
  }
})();
