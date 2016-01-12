(function() {
  'use strict';

  angular
    .module('walterApp.shell')
    .config(ShellConfig)
  ;

  ShellConfig.$inject = ['$urlRouterProvider'];
  function ShellConfig ($urlRouterProvider) {
    $urlRouterProvider.otherwise('dashboard');
  }
})();
