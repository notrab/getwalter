(function() {
  'use strict';

  angular
    .module('walterApp.form', [])
    .factory('Form', FormFactory)
  ;

  FormFactory.$inject = ['$resource'];
  function FormFactory($resource) {
    var Form = $resource('http://localhost:5000/api/forms/:id', {}, {
      'update': {
        method: 'PUT'
      }
    });

    return Form;
  }
})();
