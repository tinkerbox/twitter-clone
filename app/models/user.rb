class User < ActiveRecord::Base
  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :followers, through: :follower_follows, source: :follower
  has_many :followees, through: :followee_follows, source: :followee
  has_many :followee_follows, foreign_key: :followee_id, class_name: 'Follow' # is a join table
  has_many :follower_follows, foreign_key: :follower_id, class_name: 'Follow' # is a join table

  authenticates_with_sorcery!

  validates :password, length: { minimum: 3}, confirmation: true
  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  validates :email, uniqueness: true, presence: true, format: { with: EMAIL_REGEX , multiline: true }
  validates :username, uniqueness: true, presence: true
  validates :name, presence: true

  mount_uploader :avatar, AvatarUploader
end
