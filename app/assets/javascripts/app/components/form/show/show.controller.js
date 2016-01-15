(function() {
  'use strict';

  angular
    .module('walterApp.form.show')
    .controller('ShowFormController', ShowFormController)
  ;

  ShowFormController.$inject = ['formRes'];
  function ShowFormController (formRes) {
    var vm = this;
    vm.form = formRes;
  }
})();
