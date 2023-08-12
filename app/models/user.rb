class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:github]

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

  has_one_attached :image

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.avatar_url = auth.info.image
    end
  end
end
