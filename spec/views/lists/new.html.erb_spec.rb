require 'rails_helper'

RSpec.describe "lists/new", type: :view do
  before(:each) do
    assign(:list, List.new(
      :user => "",
      :name => "MyString",
      :privacy => "MyString",
      :description => "MyText",
      :status => "MyString"
    ))
  end

  it "renders new list form" do
    render

    assert_select "form[action=?][method=?]", lists_path, "post" do

      assert_select "input#list_user[name=?]", "list[user]"

      assert_select "input#list_name[name=?]", "list[name]"

      assert_select "input#list_privacy[name=?]", "list[privacy]"

      assert_select "textarea#list_description[name=?]", "list[description]"

      assert_select "input#list_status[name=?]", "list[status]"
    end
  end
end
