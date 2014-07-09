class ImportDictionaryJob
  include SuckerPunch::Job

  def perform(dictionary)
    dictionary_import_result = DictionaryImporterService.new(dictionary).call

    dictionary.finalize_import
    dictionary.elapsed_time = dictionary_import_result.elapsed_time

    dictionary.save
  end
end
