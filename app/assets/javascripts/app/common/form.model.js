(function() {
  'use strict';

  angular
    .module('walterApp.form', [])
    .factory('Form', FormFactory)
  ;

  FormFactory.$inject = ['$resource'];
  function FormFactory($resource) {
    var Form = $resource('http://getwalter.herokuapp.com/api/forms/:id', {}, {
      'update': {
        method: 'PUT'
      }
    });

    return Form;
  }
})();
