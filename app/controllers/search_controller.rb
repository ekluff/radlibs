class SearchController < ApplicationController
  def search
    if params[:q].nil?
      @stories = []
      @sentences = []
    else
      @stories = Story.search params[:q]
      @sentences = Sentence.search params[:q]
    end

  end
end
