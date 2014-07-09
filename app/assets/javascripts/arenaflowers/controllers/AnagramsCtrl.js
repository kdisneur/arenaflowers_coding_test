arenaflowers.controller('AnagramsCtrl', ['$scope', 'AnagramService', 'DictionaryService', function($scope, AnagramService, DictionaryService) {
  $scope.searches     = [];
  $scope.dictionaries = DictionaryService.query();

  $scope.doSearch = function() {
    $scope.searches.push(AnagramService.get({ dictionary_id: $scope.dictionary.id, id: $scope.word }));
    $scope.word = '';
  };
}]);
