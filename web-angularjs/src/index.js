import angular from 'angular';

const app = angular.module('app', []);
app.controller('MainCtrl', function($http) {
  const vm = this;
  vm.status = 'Loading...';
  $http.get('/api/ping')
    .then(resp => { vm.status = resp.data.message || 'ok'; })
    .catch(() => { vm.status = 'error'; });
});
