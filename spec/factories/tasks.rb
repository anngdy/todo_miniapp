FactoryGirl.define do
  factory :task, class: 'Task' do |task|
  	sequence(:id)

  	sequence(:title) do |title|
  		'task#{title}'
  	end

  	sequence(:content) do |content|
  		'task#{content}_content'
  	end

  	task.completed false
  	task.date_completed nil
  	task.list_id nil
  end
end
