class UsersController < ApplicationController

    def index
        @not_friends = User.where.not(
            :id => (
                current_user.friends.ids +
                current_user.received_friend_requests.ids +
                current_user.sent_friend_requests.ids +
                [current_user.id]
            )
        )
        @friends = User.where(id: current_user.friends.ids)

        @sent_requests = User.where(id: current_user.sent_friend_requests.ids)
        @friendships = Friendship.where(user_id: current_user.id)
    end

    def show
        @user = User.find(params[:id])
        @posts = @user.posts.all
        @friend_requests = @user.received_friend_requests.all
    end

    private

    def is_friend?(user)
        if current_user.friends.exists?(id: user.id) || 
            current_user.friend_requests_as_receiver.exists?(id: user.id) ||
            current_user.friend_requests_as_sender.exists?(id: user.id)
            return true
        else
            return false
        end
    end

end
