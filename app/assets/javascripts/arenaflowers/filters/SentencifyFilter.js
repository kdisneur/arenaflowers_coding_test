arenaflowers.filter('sentencify', function() {
  return function(array) {
    return array.join(', ');
  }
});
