require 'rails_helper'

RSpec.describe Bookmark, type: :model do
	it 'should add a bookmark' do
		user = FactoryGirl.build(:user)
		list = FactoryGirl.build(:list, user: user)
		bookmark = FactoryGirl.build(:bookmark, user: user, list:list)
		expect(bookmark).to be_valid
	end

	context 'with invalid attributes' do
		it 'bookmark.list is nil' do
			user = FactoryGirl.build(:user)
			list = FactoryGirl.build(:list, user: user)
			bookmark = FactoryGirl.build(:bookmark, user: user, list: nil)
			expect(bookmark).not_to be_valid
		end

		it 'bookmark.user is nil' do
			user = FactoryGirl.build(:user)
			list = FactoryGirl.build(:list, user: user)
			bookmark = FactoryGirl.build(:bookmark, user: nil, list: list)
			expect(bookmark).not_to be_valid
		end
	end  
end