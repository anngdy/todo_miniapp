require 'rails_helper'

RSpec.describe List, type: :model do
	it 'should create a list with valid attributes'	do
		user = FactoryGirl.build(:user)
		list = FactoryGirl.build(:list, user: user)
		expect(list).to be_valid
	end

	context 'should refuse to create a list with invaldi attributes' do
		it 'list.user is nil' do
			list = FactoryGirl.build(:list, user: nil)
			expect(list).not_to be_valid
		end

		it 'list.name is nil' do
			list = FactoryGirl.build(:list, name: nil)
			expect(list).not_to be_valid
		end

		it 'list.privacy is not selected' do
			list = FactoryGirl.build(:list, privacy: nil)
			expect(list).not_to be_valid
		end
	end
end
