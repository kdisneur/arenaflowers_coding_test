arenaflowers.factory('DictionaryService', ['$resource', function($resource) {
  return $resource('/api/dictionaries/:id', { id: '@' });
}]);
