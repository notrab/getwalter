(function() {
  'use strict';

  angular
    .module('walterApp.form.show')
    .controller('ShowFormController', ShowFormController)
  ;

  ShowFormController.$inject = ['Form', '$stateParams'];
  function ShowFormController (Form, $stateParams) {
    var vm = this;
    vm.form = {};

    Form.get({
      id: $stateParams.id
    }, function (data) {
      vm.form = data;
    });
  }
})();
