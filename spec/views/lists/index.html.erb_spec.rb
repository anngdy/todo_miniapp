require 'rails_helper'

RSpec.describe "lists/index", type: :view do
  before(:each) do
    assign(:lists, [
      List.create!(
        :user => "",
        :name => "Name",
        :privacy => "Privacy",
        :description => "MyText",
        :status => "Status"
      ),
      List.create!(
        :user => "",
        :name => "Name",
        :privacy => "Privacy",
        :description => "MyText",
        :status => "Status"
      )
    ])
  end

  it "renders a list of lists" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Privacy".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
