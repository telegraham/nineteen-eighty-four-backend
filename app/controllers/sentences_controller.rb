class SentencesController < ApplicationController
  def index
    page = Sentence.after(params[:after])
    last_id = page.last ? page.last.id : params[:after]
    render json: { 
      sentences: page,
      remaining: Sentence.count_after(last_id)
    }
  end

  def update
    @sentence = Sentence.find(params[:id])
    if @sentence.update(sentence_params)
      render json: @sentence
    else
      render json: @sentence.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    Sentence.destroy(params[:id])
    render json: { destroyed: true }
  end

  private

  def sentence_params
    params.permit(:text)
  end
end
