require 'rails_helper'

RSpec.describe "bookmarks/edit", type: :view do
  before(:each) do
    @bookmark = assign(:bookmark, Bookmark.create!(
      :list => nil,
      :user => nil
    ))
  end

  it "renders the edit bookmark form" do
    render

    assert_select "form[action=?][method=?]", bookmark_path(@bookmark), "post" do

      assert_select "input#bookmark_list_id[name=?]", "bookmark[list_id]"

      assert_select "input#bookmark_user_id[name=?]", "bookmark[user_id]"
    end
  end
end
