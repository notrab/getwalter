(function() {
  'use strict';

  angular
    .module('walterApp.auth', [])
    .factory('LocalService', LocalService)
    .factory('Auth', Auth)
    .factory('AuthInterceptor', AuthInterceptor)
    .factory('CurrentUser', CurrentUser)
    .config(AuthConfig)
  ;

  AuthInterceptor.$inject = ['$q', '$injector'];
  function AuthInterceptor ($q, $injector) {
    var LocalService = $injector.get('LocalService');

    return {
      request: function(config) {
        var token;
        if (LocalService.get('auth_token')) {
          token = angular.fromJson(LocalService.get('auth_token')).token;
        }
        if (token) {
          config.headers.Authorization = 'Bearer ' + token;
        }
        return config;
      },

      responseError: function(response) {
        if (response.status === 401 || response.status === 403) {
          LocalService.unset('auth_token');
          $injector.get('$state').go('guest.login');
        }
        return $q.reject(response);
      }
    };
  };

  Auth.$inject = ['$http', 'LocalService', 'AccessLevels'];
  function Auth ($http, LocalService, AccessLevels) {
    function checkTokenStatus(token) {
      $http.get('/auth/token_status?token=' + token);
    }

    var token = LocalService.get('auth_token');

    if (token) {
      token = angular.fromJson(LocalService.get('auth_token')).token;
      checkTokenStatus(token);
    }

    return {
      authorize: function(access) {
        if (access === AccessLevels.user) {
          return this.isAuthenticated();
        } else {
          return true;
        }
      },
      isAuthenticated: function() {
        return LocalService.get('auth_token');
      },
      login: function(credentials) {
        var login = $http.post('/auth/authenticate', credentials);
        login.success(function(result) {
          LocalService.set('auth_token', JSON.stringify(result));
        });
        return login;
      },
      logout: function() {
        // The backend doesn't care about logouts, delete the token and you're good to go.
        LocalService.unset('auth_token');
      },
      register: function(formData) {
        LocalService.unset('auth_token');
        var register = $http.post('/auth/register', formData);
        register.success(function(result) {
          LocalService.set('auth_token', JSON.stringify(result));
        });
        return register;
      }
    };
  };

  function LocalService () {
    return {
      get: function(key) {
       return localStorage.getItem(key);
      },

      set: function(key, val) {
       return localStorage.setItem(key, val);
      },

      unset: function(key) {
       return localStorage.removeItem(key);
      }
    }
  }

  CurrentUser.$inject = ['LocalService'];
  function CurrentUser (LocalService) {
    if (LocalService.get('auth_token')) {
      return angular.fromJson(LocalService.get('auth_token')).user;
    } else {
      return {};
    }
  }

  AuthConfig.$inject = ['$httpProvider'];
  function AuthConfig ($httpProvider) {
    $httpProvider.interceptors.push('AuthInterceptor');
  };
})();
