class SearchController < ApplicationController
  def search
    if params[:q].nil?
      @stories = []
      @sentences = []
      render :search
    else
      @stories = Story.search params[:q]
      @sentences = Sentence.search params[:q]
      render :search
    end

  end
end
