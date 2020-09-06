class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable, omniauth_providers: %i[facebook]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.first_name + ' ' + auth.info.last_name
    end
  end

  validates :name, :password, :email, presence: true

  has_one :profile

  has_and_belongs_to_many :friends, :class_name => "User", :join_table => "friendships", :foreign_key => "user_id", :association_foreign_key => "friend_id"

  has_many :friend_requests_as_receiver, class_name: "FriendRequest", foreign_key: "receiver_id"
  has_many :received_friend_requests, through: "friend_requests_as_receiver", class_name: "User", source: "sender"

  has_many :friend_requests_as_sender, class_name: "FriendRequest", foreign_key: "sender_id"
  has_many :sent_friend_requests, through: "friend_requests_as_sender", class_name: "User", source: "receiver"

  has_many :posts
  has_many :likes
end
