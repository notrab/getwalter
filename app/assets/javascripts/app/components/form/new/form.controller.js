(function() {
  'use strict';

  angular
    .module('walterApp.form.new')
    .controller('NewFormController', NewFormController)
  ;

  function NewFormController () {
    var vm = this;
    vm.message = 'Hello Jamie';
  }
})();
