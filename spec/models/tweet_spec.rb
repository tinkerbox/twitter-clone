require 'rails_helper'

describe Tweet, :type => :model do
  it { is_expected.to validate_presence_of :text }

  it { is_expected.to have_many :likes }
  it { is_expected.to belong_to :user}
end