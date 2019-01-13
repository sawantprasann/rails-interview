angular.module('studentApp')
.controller('StudentController', ['students', function (students) {
  var ctrl = this;  
  ctrl.sortType = 'name';
  ctrl.sortReverse = false;
  ctrl.isLoading = true;

  ctrl.setSort = function (type) {
    if (type === ctrl.sortType) {
      ctrl.sortReverse = !ctrl.sortReverse;
    } else {
      ctrl.sortReverse = false;
    }

    ctrl.sortType = type;
  };

  ctrl.isSortedBy = function (type) {
    return ctrl.sortType === type;
  };

  students.$promise.then(function (students) {
    ctrl.students = students;
    ctrl.isLoading = false;
  }, function (err) {
    ctrl.isLoading = false;
    ctrl.hasError = true;
  })
}])
