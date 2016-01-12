(function() {
  'use strict';

  angular
    .module('walterApp.form.list')
    .config(ListFormConfig)
  ;

  ListFormConfig.$inject = ['$stateProvider'];
  function ListFormConfig ($stateProvider) {
    $stateProvider
      .state('form', {
        url: '/forms',
        templateUrl: 'assets/app/components/form/list/list',
        controller: 'ListFormController',
        controllerAs: 'list',
        data: {
          pageTitle: 'Your Forms'
        }
      })

      .state('form.new', {
        url: '/new',
        templateUrl: 'assets/app/components/form/new/new',
        controller: 'NewFormController',
        controllerAs: 'new',
        data: {
          pageTitle: 'Get started creating a new form'
        }
      })

      .state('form.show', {
        url: '/:id',
        templateUrl: 'assets/app/components/form/show/show',
        controller: 'ShowFormController',
        controllerAs: 'form',
        data: {
          pageTitle: 'Editing form'
        }
      })
    ;
  }
})();
