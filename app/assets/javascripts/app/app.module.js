
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

      'walterApp.form',
      'walterApp.form.list',
      'walterApp.form.show',
      'walterApp.form.new',
    ])
  ;
