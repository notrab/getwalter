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
      templateUrl: 'assets/app/components/navbar/navbar.html',
      controller: NavbarController
    }
  }

  function NavbarController () {
    var vm = this;
  }
})();
