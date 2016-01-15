
  angular
    .module('walterApp', [
      'ngAnimate',
      'ngResource',
      'countTo',

      'ui.router',
      'templates',

      'angular-loading-bar',

      'walterApp.shell',
      'walterApp.dashboard',
      'walterApp.account',

      'walterApp.navbar',

      'walterApp.user',

      'walterApp.form',
      'walterApp.form.list',
      'walterApp.form.show',
      'walterApp.form.edit',
      'walterApp.form.new',
    ])
  ;
