class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable, omniauth_providers: %i[facebook]

  validates :name, :password, :email, presence: true

  has_and_belongs_to_many :friends, :class_name => "User", :join_table => "friendships", :foreign_key => "user_id", :association_foreign_key => "friend_id"

  has_many :friend_requests_as_receiver, foreign_key: :receiver_id, class_name: :Friendship
  has_many :received_friend_requests, through: :friend_requests_as_receiver, foreign_key: :sender_id

  has_many :friend_requests_as_sender, foreign_key: :sender_id, class_name: :Friendship
  has_many :sent_friend_requests, through: :friend_requests_as_sender, foreign_key: :receiver_id

  has_many :posts
  has_many :likes
end
