module API
  class DictionariesController < ApplicationController
    expose(:dictionary, attributes: :dictionary_params)
    expose(:imported_dictionaries) { Dictionary.imported }

    def index
    end

    def create
      @dictionary_result = OpenStruct.new(accepted: false, errors: [])

      if dictionary.save
        ImportDictionaryJob.new.async.perform(dictionary)
        @dictionary_result.accepted = true
      else
        @dictionary_result.errors = dictionary.errors.full_messages
      end
    end

    private

    def dictionary_params
      params.require(:dictionary).permit(:name, :file)
    end
  end
end
