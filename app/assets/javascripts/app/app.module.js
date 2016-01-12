
  angular
    .module('walterApp', [
      'ngAnimate',
      'ui.router',
      'templates',

      'angular-loading-bar',

      'walterApp.shell',
      'walterApp.dashboard',
      'walterApp.navbar',

      'walterApp.form.new',
    ])
  ;
