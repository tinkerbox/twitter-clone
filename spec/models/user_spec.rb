require 'rails_helper'

describe User do
	context 'validation' do
		it { should validate_length_of(:password).is_at_least(3)  }
		it { should validate_presence_of :email }
		it { should validate_presence_of :username }
		it { should validate_presence_of :name }
	end
end