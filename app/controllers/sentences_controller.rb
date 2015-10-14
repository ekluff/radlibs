class SentencesController < ApplicationController

  def create
    @story = Story.find(params[:story_id])
    @sentence = @story.sentences.new(sentence_params)
    if @sentence.save
      flash[:notice] = "This lib is one sentence radder."
      redirect_to story_path(@story)
    else
      flash[:alert] = "You'll learn to write sentences one day. Perhaps try again?"
      redirect_to story_path(@story)
    end
  end

  private

  def sentence_params
    params.require(:sentence).permit(:content)
  end

end
