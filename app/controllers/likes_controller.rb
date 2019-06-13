class LikesController < ApplicationController

  def create
    @like = Like.new(like_params)
    if @like.save
      render json: { 
        sentence_id: @like.sentence_id,
        new_like_count: @like.sentence.likes.count 
      }
    else
      render json: @like.errors.full_messages, status: :unprocessable_entity
    end
  end


  private

  def like_params
    params.permit(:sentence_id)
  end
end
