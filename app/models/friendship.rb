class Friendship < ApplicationRecord
    validates_uniqueness_of :user_id, scope: [:friend_id]
end
