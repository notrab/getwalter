(function() {
  'use strict';

  angular
    .module('walterApp.navbar', [])
    .directive('navbar', navbar)
    .controller('NavbarController', NavbarController)
  ;

  function navbar () {
    return {
      restrict: 'AE',
      template: '<header><div class="wrapper"><h1 class="logo"><a ui-sref="dashboard">Walter</a></h1></div></header>',
      controller: NavbarController
    }
  }

  function NavbarController () {
    var vm = this;
  }
})();
