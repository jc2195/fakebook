class UsersController < ApplicationController

    def index
        @users = User.where.not(
            :id => (
                current_user.friends.ids +
                current_user.received_friend_requests.ids +
                current_user.sent_friend_requests.ids +
                [current_user.id]
            )
        )
    end

    def show
        @posts = current_user.posts.all
        @friend_requests = current_user.received_friend_requests.all
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
