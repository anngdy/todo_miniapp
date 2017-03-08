require 'rails_helper'

RSpec.describe User, type: :model do
	it 'should create an user with valid attributes' do
		user = FactoryGirl.build(:user)
		expect(user).to be_valid
	end

	context 'refuse to create a user with invalid attributes' do
		 it 'user.email is nil' do
			user = FactoryGirl.build(:user, email: nil)
			expect(user).not_to be_valid
		end

		it 'user.password and user.password_confirmation do not match' do
			user = FactoryGirl.build(:user, password: 'qwert')
			expect(user).not_to be_valid
		end

		it 'user.username is nil' do
			user = FactoryGirl.build(:user, username: nil)
			expect(user).not_to be_valid
		end
	end
end
