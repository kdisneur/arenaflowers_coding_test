arenaflowers.factory('AnagramService', ['$resource', function($resource) {
  return $resource('/api/dictionaries/:dictionary_id/anagrams/:id', { id: '@', dictionary_id: '@' });
}]);
