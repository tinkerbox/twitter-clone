class Tweet < ActiveRecord::Base
  belongs_to :user

  def self.search(search)
  	where("lower(text) LIKE ?", "%#{search}%")
  end
end
