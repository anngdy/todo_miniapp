require 'rails_helper'

RSpec.feature 'User signUp', type: :feature do
	scenario 'should allow a user to register' do
		user = FactoryGirl.build(:user)
		visit user_registration_path
		fill_in 'Name', with: user.name
		fill_in 'Username', with: user.username
		fill_in 'Email', with: user.email
		fill_in 'Password', with: user.password
		fill_in 'Password Confirmation', with: user.password_confirmation

		click_button 'Get Started'
		expect(page).to have_text("Welcome! You have signed up successfully.")
		expect(response).to redirect_to (root_path)
	end

	scenario 'should not allow user to register' do
		user = FactoryGirl.build(:user)
		visit user_registration_path
		fill_in 'Name', with: user.name
		fill_in 'Username', with: user.username
		fill_in 'Email', with: user.email
		fill_in 'Password', with: user.password
		fill_in 'Password Confirmation', with: 'randonpassword'

		click_button 'Get Started'
		expect(page).to have_text("#{errors.count} prohibited this user from beeing saved")
		expect(response).to redirect_to (user_registration_path)
	end
end




