class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, uniqueness: true
  validates :email, uniqueness: true
         

  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, foreign_key: 'author_id', dependent: :destroy
  has_many :commented_posts, through: :comments, source: :post
  has_many :notifications, foreign_key: 'notifier_id', dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships, dependent: :destroy


  def friend_requests
    @incoming_requests = Friendship.where(friend_id: current_user.id).where(status: "pending")
  end

  def accept_friend_request
    request = Friendship.find(params[:id])
    user1 = request.user
    user2 = request.friend

    notification = Notification.where(friendship_id: params[:id])
    notification.destroy_all
    request.destroy

    Friendship.create(user_id: user1.id, friend_id: user2.id, status: "friends")
    Friendship.create(user_id: user2.id, friend_id: user1.id, status: "friends")
    redirect_back(fallback_location: root_path)
  end

  def decline_friend_request
    request = Friendship.find(params[:id])
    notification = Notification.where(friendship_id: params[:id])
    notification.destroy_all
    request.destroy

    redirect_back(fallback_location: root_path)
  end

  def friend_list
    @user = User.find(params[:id])
  end


end
