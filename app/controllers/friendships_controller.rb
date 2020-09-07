class FriendshipsController < ApplicationController
  def create
    Friendship.create(friendship_params)
    Friendship.create(user_id: friendship_params[:friend_id], friend_id: friendship_params[:user_id])
    @friend_request = FriendRequest.find_by(sender_id: friendship_params[:friend_id], receiver_id: friendship_params[:user_id])
    @friend_request.delete
    flash[:success] = "Friend request accepted!"
    redirect_to user_path(current_user[:id])
  end

  def destroy
    @friendship1 = Friendship.find(params[:id])
    @user = @friendship1.user_id
    @friend = @friendship1.friend_id
    @friendship2 = Friendship.find_by(user_id: @friend, friend_id: @user)
    @friendship1.delete
    @friendship2.delete
    redirect_back(fallback_location: root_path)
  end

  private

  def friendship_params
    params.permit(:user_id, :friend_id)
  end
end
