(function() {
  'use strict';

  angular
    .module('walterApp')
    .directive('scroll', scroll)
  ;

  function scroll ($window) {
    return function(scope, element, attrs) {
      angular.element($window).bind("scroll", function() {
        if (this.pageYOffset >= 10) {
           scope.scrolledBeyondHeader = true;
         } else {
           scope.scrolledBeyondHeader = false;
         }
        scope.$apply();
      });
    };
  };
})();
