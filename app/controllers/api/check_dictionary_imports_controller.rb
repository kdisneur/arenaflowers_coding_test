module API
  class CheckDictionaryImportsController < ApplicationController
    expose(:check_result) { OpenStruct.new(import_on_going: Dictionary.ongoing.present?) }

    def show
    end
  end
end
