FactoryGirl.define do
  factory :bookmark, class: 'Bookmark' do |bookmark|
  	sequence(:id)

  	bookmark.list_id nil
  	bookmark.user_id nil
  end
end
