require 'rails_helper'

RSpec.describe BookmarksController, type: :controller do

  describe "get #index" do
    it "should show current_user bookmarks" do
      current_user = FactoryGirl.build(:user)
      list = FactoryGirl.build(:list, user: current_user)
      bookmark = FactoryGirl.build(:bookmark, user: current_user, list:list)
      expect(bookmark).to be_truthy
    end
  end

  describe 'get #new' do
    it 'assigns a new bookmark' do
      current_user = FactoryGirl.build(:user)
      list = FactoryGirl.build(:list, user: current_user)
      bookmark = FactoryGirl.build(:bookmark, user: current_user, list:list)
      expect(bookmark).to be_valid
    end
  end

  describe 'post #create' do
    context 'with valid params' do
      it 'create a new bookmark' do
        current_user = FactoryGirl.build(:user)
        list = FactoryGirl.build(:list, user: current_user)
        bookmark = FactoryGirl.build(:bookmark, user: current_user, list:list)
        expect(bookmark).not_to be_nil
        expect(bookmark).to change(Bookmark, :count).by(1)
      end

      it 'assigns a new create bookmark as a @bookmark' do
        current_user = FactoryGirl.build(:user)
        list = FactoryGirl.build(:list, user: current_user)
        bookmark = FactoryGirl.build(:bookmark, user: current_user, list:list)
        expect(bookmark).to be_a_new(Bookmark)
      end

      it 'redirect do bookmarks list' do
        current_user = FactoryGirl.build(:user)
        list = FactoryGirl.build(:list, user: current_user)
        bookmark = FactoryGirl.build(:bookmark, user: current_user, list:list)
        expect(response).to redirect_to (bookmarks_url)
      end
    end

    context 'with invalid params' do 
      it 'refuse to create a bookmark' do
        current_user = FactoryGirl.build(:user)
        list = FactoryGirl.build(:list, user: current_user)
        bookmark = FactoryGirl.build(:bookmark, user: nil, list:list)
        expect(bookmark).not_to be_valid
      end

      it 're-render the template' do
        current_user = FactoryGirl.build(:user)
        list = FactoryGirl.build(:list, user: current_user)
        bookmark = FactoryGirl.build(:bookmark, user: nil, list:list)
        expect(response).to render_template("new")
      end
    end
  end

  describe 'delete #destroy' do
    it 'delete the selected bookmark' do
      current_user = FactoryGirl.build(:user)
      list = FactoryGirl.build(:list, user: current_user)
      bookmark = FactoryGirl.build(:bookmark, user: current_user, list:list)
      expect{
        delete :destroy, params: { id: bookmark.id }
      }.to change(Bookmark, :count).by(-1)
    end

    it 'redirect to bookmark list' do
      current_user = FactoryGirl.build(:user)
      list = FactoryGirl.build(:list, user: current_user)
      bookmark = FactoryGirl.build(:bookmark, user: current_user, list:list)
      expect(response).to redirect_to (bookmarks_url)
     end
  end
end