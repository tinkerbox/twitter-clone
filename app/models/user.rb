class User < ActiveRecord::Base
  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :followers, through: :followee_follows, source: :follower
  has_many :followees, through: :follower_follows, source: :followee
  has_many :followee_follows, foreign_key: :followee_id, class_name: 'Follow' # is a join table
  has_many :follower_follows, foreign_key: :follower_id, class_name: 'Follow' # is a join table

  authenticates_with_sorcery!

  validates :password, length: { minimum: 3}, confirmation: true
  EMAIL_REGEX = /@/
  validates :email, uniqueness: true, presence: true, format: { with: EMAIL_REGEX , multiline: true }, case_sensitive: false
  validates :username, uniqueness: true, presence: true
  validates :name, presence: true

  mount_uploader :avatar, AvatarUploader

  def self.search(search)
  	where("username LIKE ?", "%#{search}%")
  end
end
