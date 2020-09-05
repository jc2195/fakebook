class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice] = "You posted a comment on #{@comment.post.user.name}'s post!"
    else
      flash[:notice] = "Your comment can't be blank!"
    end
    redirect_to posts_path
  end

  def destroy
    @comment = Comment.find_by(comment_params)
    if @comment.delete
      flash[:notice] = "You deleted your comment on #{@comment.post.user.name}'s post!"
    end
    redirect_to posts_path
  end

  private

  def comment_params
    params.permit(:user_id, :post_id, :content)
  end
end
