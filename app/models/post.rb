class Post < ApplicationRecord
    validates :content, presence: true

    belongs_to :user
    has_many :likes
    has_many :comments

    has_one_attached :image
end
