class FriendshipsController < ApplicationController
  def create
    Friendship.create(friendship_params)
    Friendship.create(user_id: friendship_params[:friend_id], friend_id: friendship_params[:user_id])
    @friend_request = FriendRequest.find_by(sender_id: friendship_params[:friend_id], receiver_id: friendship_params[:user_id])
    @friend_request.delete
    flash[:notice] = "Friend request accepted!"
    redirect_to user_path(current_user[:id])
  end

  private

  def friendship_params
    params.permit(:user_id, :friend_id)
  end
end
