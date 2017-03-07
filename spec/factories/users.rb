FactoryGirl.define do
  factory :user, class: 'User' do |user|
  	sequence(:name) do |name|
  		'user#{name}_name'
  	end

  	sequence(:username) do |username|
  		'user#{username}_username'
  	end

  	sequence(:email) do |email|
  		'user#{email}@example.com'
  	end

  	user.password 'qwerty'
  	user.password_confirmation 'qwerty'
    
  end
end
