class AnagramFinderService < Struct.new(:dictionary)
  def self.call(dictionary, word)
    new(dictionary).call(word)
  end

  def call(word)
    anagram_result = OpenStruct.new(word: word, elapsed_time: nil, results: [])

    elapsed_time = Benchmark.realtime do
      key                = word.chars.sort.join
      anagrams_directory = Rails.root.join('public', 'anagrams', File.basename(dictionary.file.path), word.length.to_s)
      anagram_file_path  = File.join(anagrams_directory, "#{key}.txt")

      if File.exists?(anagram_file_path)
        anagram_result.results = File.readlines(anagram_file_path).map(&method(:clean_word)).reject { |anagram| anagram == word }
      end
    end

    anagram_result.elapsed_time = elapsed_time

    anagram_result
  end

  private

  def clean_word(word)
    word.chomp.strip
  end

  def current_word?(anagram)
    anagram == word
  end
end
