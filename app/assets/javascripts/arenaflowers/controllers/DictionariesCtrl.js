arenaflowers.controller('DictionariesCtrl', ['$scope', '$http', 'DictionaryService', function($scope, $http, DictionaryService) {
  $scope.errors          = [];
  $scope.import_on_going = false;
  $scope.importDictionary = function(data) {
    if (data.accepted) {
      $scope.name = '';
      $scope.file = '';
    } else {
      $scope.errors = data.errors;
    }
  }

  var onGoingImportPoller = function() {
    $http.get('/api/check_dictionary_imports.json').success(function(data) {
      $scope.import_on_going = data.import_on_going;
      setTimeout(onGoingImportPoller, 1000 * 30)
    })
  };

  onGoingImportPoller();
}]);
