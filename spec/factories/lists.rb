FactoryGirl.define do
  factory :list do |list|

  	sequence(:id)

  	sequence(:name) do |name|
  		'list#{name}'
  	end

  	sequence(:description) do |description|
  		'list#{description}_description'
  	end

  	list.privacy 'public'
  	list.status 'open'
  	list.user_id nil
  end
end
