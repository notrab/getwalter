(function() {
  'use strict';

  angular
    .module('walterApp.form.list')
    .controller('ListFormController', ListFormController)
  ;

  ListFormController.$inject = ['Form'];
  function ListFormController (Form) {
    var vm = this;

    Form.query({}, function (forms) {
      vm.forms = forms;
    });
  }
})();
