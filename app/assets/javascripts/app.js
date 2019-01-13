angular.module('studentApp', ['ui.router', 'templates', 'ngResource'])
.config(['$stateProvider', '$urlRouterProvider', function ($stateProvider, $urlRouterProvider) {
  $stateProvider
    .state('student', {
      url: '/',
      templateUrl: 'student/_student.html',
      controller: 'StudentController',
      controllerAs: 'student',
      resolve: {
        students: function (Student) {
          return Student.query();
        }
      }
    });

  $urlRouterProvider.otherwise('/');
}]);
