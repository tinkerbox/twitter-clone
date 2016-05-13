require 'rails_helper'

describe User, :type => :model do

	context 'validation' do
		it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_uniqueness_of :email }
		it { is_expected.to validate_presence_of :username }
		it { is_expected.to validate_presence_of :name }

    it { is_expected.to validate_length_of(:password).is_at_least(3) }
    it { is_expected.to validate_confirmation_of :password }
	end

  context 'relations' do
    user = FactoryGirl.build(:user)
    it { is_expected.to have_many :tweets }
    it { is_expected.to have_many :likes }
    it { is_expected.to have_many(:followers).through(:followee_follows).source(:follower) }
    it { is_expected.to have_many(:followees).through(:follower_follows).source(:followee) }
    it { expect{ user.destroy }.to change { Tweet.count } }
  end

end