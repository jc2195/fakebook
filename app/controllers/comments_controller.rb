class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:success] = "You posted a comment on #{@comment.post.user.name}'s post!"
    else
      flash[:warning] = "Your comment can't be blank!"
    end
    redirect_to posts_path
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.delete
      flash[:success] = "Comment deleted!"
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.permit(:user_id, :post_id, :content)
  end
end
