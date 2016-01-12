(function() {
  'use strict';

  angular
    .module('walterApp', [
      'ui.router',
      'walterApp.shell',
      'walterApp.dashboard',
      'walterApp.navbar'
    ])
  ;
})();
