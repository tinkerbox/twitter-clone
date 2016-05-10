class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3}, confirmation: true
  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  validates :email, uniqueness: true, presence: true, format: { with: EMAIL_REGEX , multiline: true }
  validates :username, uniqueness: true, presence: true
  validates :name, presence: true

  mount_uploader :avatar, AvatarUploader
end
