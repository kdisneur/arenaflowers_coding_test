module API
  class AnagramsController < ApplicationController
    expose(:dictionary)
    expose(:anagram_result) { AnagramFinderService.new(dictionary).call(params[:id]) }

    def show
    end
  end
end
