
  angular
    .module('walterApp', [
      'ngAnimate',
      'ngResource',
      'countTo',
      'angularMoment',
      'angular-loading-bar',

      'ui.router',
      'templates',

      'walterApp.shell',
      'walterApp.dashboard',
      'walterApp.account',

      'walterApp.navbar',

      'walterApp.auth',
      'walterApp.user',

      'walterApp.form',
      'walterApp.form.list',
      'walterApp.form.show',
      'walterApp.form.edit',
      'walterApp.form.new',
    ])
    .constant('AccessLevels', {guest: 0, user: 1})
  ;
