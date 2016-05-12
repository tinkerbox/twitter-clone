class Tweet < ActiveRecord::Base
  belongs_to :user
  validates :text, presence: true

  def self.search(search)
  	where("lower(text) LIKE ?", "%#{search}%")
  end
end