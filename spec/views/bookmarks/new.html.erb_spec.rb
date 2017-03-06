require 'rails_helper'

RSpec.describe "bookmarks/new", type: :view do
  before(:each) do
    assign(:bookmark, Bookmark.new(
      :list => nil,
      :user => nil
    ))
  end

  it "renders new bookmark form" do
    render

    assert_select "form[action=?][method=?]", bookmarks_path, "post" do

      assert_select "input#bookmark_list_id[name=?]", "bookmark[list_id]"

      assert_select "input#bookmark_user_id[name=?]", "bookmark[user_id]"
    end
  end
end
