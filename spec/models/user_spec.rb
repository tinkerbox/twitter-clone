require 'rails_helper'

describe User do
	context 'validation' do
		it { is_expected.to validate_length_of(:password).is_at_least(3)  }
		it { is_expected.to validate_presence_of :email }
		it { is_expected.to validate_presence_of :username }
		it { is_expected.to validate_presence_of :name }
	end


end