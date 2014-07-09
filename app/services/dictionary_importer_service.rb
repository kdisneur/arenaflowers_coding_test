class DictionaryImporterService < Struct.new(:dictionary)
  def self.call(dictionary)
    new(dictionary).call
  end

  def file
    @file || File.open(dictionary.file.path, 'r')
  end

  def call
    dictionary_import_result = OpenStruct.new(elapsed_time: nil)

    elapsed_time = Benchmark.realtime do
      file.map(&method(:clean_word)).reject(&method(:already_imported?)).each(&method(:import_word))
    end

    dictionary_import_result.elapsed_time = elapsed_time

    dictionary_import_result
  end

  private

  def clean_word(word)
    word.chomp.strip
  end

  def already_imported?(word)
    AnagramFinderService.new(dictionary).call(word).results.present?
  end

  def import_word(word)
    key                = word.chars.sort.join
    anagrams_directory = Rails.root.join('public', 'anagrams', File.basename(file.path), word.length.to_s)

    FileUtils.mkdir_p(anagrams_directory)
    File.open(File.join(anagrams_directory, "#{key}.txt"), 'a') { |anagram_file| anagram_file.puts(word) }
  end
end
