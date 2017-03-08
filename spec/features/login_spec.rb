require 'rails_helper'

RSpec.feature 'User LogIn', type: :feature do
	scenario 'should allow access to a registered user' do
		user = FactoryGirl.build(:user)
		visit new_user_session_path
		fill_in 'Email', with: user.email
		fill_in 'Password', with: user.password

		click_button 'Login'
		expect(page).to have_text("Signed in seccessfully.")
		expect(response).to redirect_to (root_path)
	end

	scenario 'should not allow access ' do
		it 're-render login path' do
			visit new_user_session_path
			fill_in 'Email', with: 'notregistreduser@example.com'
			fill_in 'Password', with: 'randompassword'

			click_button 'Login'
			expect(page).to have_text("#{errors.count} prohibited this user acceess")
			expect(response).to redirect_to (new_user_session_path)
		end
	end
end