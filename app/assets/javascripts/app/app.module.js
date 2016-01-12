
  angular
    .module('walterApp', [
      'ngAnimate',
      'ngResource',

      'ui.router',
      'templates',

      'angular-loading-bar',

      'walterApp.shell',
      'walterApp.dashboard',
      'walterApp.navbar',

      'walterApp.form.new',
    ])
  ;
