require 'rails_helper'

RSpec.describe "lists/edit", type: :view do
  before(:each) do
    @list = assign(:list, List.create!(
      :user => "",
      :name => "MyString",
      :privacy => "MyString",
      :description => "MyText",
      :status => "MyString"
    ))
  end

  it "renders the edit list form" do
    render

    assert_select "form[action=?][method=?]", list_path(@list), "post" do

      assert_select "input#list_user[name=?]", "list[user]"

      assert_select "input#list_name[name=?]", "list[name]"

      assert_select "input#list_privacy[name=?]", "list[privacy]"

      assert_select "textarea#list_description[name=?]", "list[description]"

      assert_select "input#list_status[name=?]", "list[status]"
    end
  end
end
