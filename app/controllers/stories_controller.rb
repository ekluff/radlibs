class StoriesController < ApplicationController

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      flash[:notice] = "Story created to great success. You are so creative. You should start that novel you've been thinking about. Did you know you can self publish now?"
      redirect_to story_path(@story)
    else
      flash[:alert] = "Story not created to great failure. Probably was not so great. Maybe try again, mister Baggins?"
      render :new
    end
  end

  def show
    @story = Story.find(params[:id])
  end

  private

  def story_params
    params.require(:story).permit(:title)
  end

end
