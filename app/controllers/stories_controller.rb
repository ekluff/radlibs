class StoriesController < ApplicationController

  def new
    @user = current_user
    @story = Story.new
  end

  def index
    @stories = Story.all
    @story = Story.new
  end

  def create
    @user = current_user
    @story = @user.stories.new(story_params)
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
    @user = @story.user
    @sentence = Sentence.new
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy
    redirect_to stories_path
  end

  private

  def story_params
    params.require(:story).permit(:title, :asset)
  end

end
