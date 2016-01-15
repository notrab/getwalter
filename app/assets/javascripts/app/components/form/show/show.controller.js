(function() {
  'use strict';

  angular
    .module('walterApp.form.show')
    .controller('ShowFormController', ShowFormController)
  ;

  ShowFormController.$inject = ['formRes', '$rootScope'];
  function ShowFormController (formRes, $rootScope) {
    var vm = this;
    vm.form = formRes;

    $rootScope.pageTitle = vm.form.name;
  }
})();
