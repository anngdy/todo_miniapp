require 'rails_helper'

RSpec.describe Task, type: :model do
	it 'should create a task with valid attributes' do
		user = FactoryGirl.build(:user)
		list = FactoryGirl.build(:list, user: user)
		task = FactoryGirl.build(:task, list: list)
		expect(task).to be_valid
	end 

	it 'should refuse to create a task with missing attributes' do
		task = FactoryGirl.build(:task, title: nil)
		expect(task).not_to be_valid
	end
end
