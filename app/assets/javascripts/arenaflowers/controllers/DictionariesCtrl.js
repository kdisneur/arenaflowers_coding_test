arenaflowers.controller('DictionariesCtrl', ['$rootScope', '$scope', '$http', 'DictionaryService', function($rootScope, $scope, $http, DictionaryService) {
  $scope.errors          = [];
  $scope.import_on_going = false;
  $scope.importDictionary = function(data) {
    if (data.accepted) {
      $scope.name   = '';
      $scope.file   = '';
      $scope.errors = []
      $scope.import_on_going = true;
    } else {
      $scope.errors = data.errors;
    }
  }

  var onGoingImportPoller = function() {
    $http.get('/api/check_dictionary_imports.json').success(function(data) {
      if($scope.import_on_going && !data.import_on_going) {
        $rootScope.$broadcast('new-dictionary-imported');
      }
      $scope.import_on_going = data.import_on_going;
      setTimeout(onGoingImportPoller, 1000 * 2);
    })
  };

  onGoingImportPoller();
}]);
