class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)
    if @like.save
      flash[:success] = "You liked #{@like.post.user.name}'s post!"
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(like_params)
    if @like.delete
      flash[:success] = "You unliked #{@like.post.user.name}'s post!"
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def like_params
    params.permit(:user_id, :post_id)
  end
end
