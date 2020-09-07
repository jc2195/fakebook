class PostsController < ApplicationController
  def index
    user_friends = current_user.friends.all.map { |friend| friend.id }
    @posts = Post.where(user_id: current_user[:id]).or(Post.where(user_id: user_friends)).order('created_at DESC').includes(:likes, :comments)
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = 'Your post has been created!'
    else
      flash[:warning] = "Your post can't be blank!"
    end
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.delete
      flash[:success] = "Post deleted!"
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def post_params
    params.permit(:user_id, :content, :image)
  end
end
