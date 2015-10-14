class SentencesController < ApplicationController

  def create
    @story = Story.find(params[:story_id])
    @sentence = @story.sentences.new(sentence_params)
    if @sentence.save
      flash[:notice] = "This lib is one sentence radder."
      redirect_to story_path(@story)
    else
      string = ""
      @sentence.errors.full_messages.each { |msg| string += msg + ". " }
      flash[:alert] = "#{string}"
      redirect_to story_path(@story)
    end
  end

  private

  def sentence_params
    params.require(:sentence).permit(:content, :asset)
  end

end
