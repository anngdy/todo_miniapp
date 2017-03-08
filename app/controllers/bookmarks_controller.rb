class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]

  def index
    @bookmarks = Bookmark.where(user_id: current_user.id)
  end

    def new
    user = User.where.not(id: current_user.id)
    @list = List.where(user_id: user).where(privacy: 'public')
    @bookmark = Bookmark.new
  end

  def create
    @errors = {}
    params = bookmark_params

    list = List.find(params[:list][:id])
    params[:list_id] = list ? list.id : nil
    params.delete(:list)

    @bookmark = Bookmark.new(params)
    @bookmark.user_id = current_user.id

    respond_to do |format|
      if @bookmark.save
        format.html { redirect_to bookmarks_path, notice: 'Bookmark was successfully created.' }
        format.json { render :show, status: :created, location: @bookmark }
      else
        format.html { render :new }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bookmark.destroy
    respond_to do |format|
      format.html { redirect_to bookmarks_url, notice: 'Bookmark was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bookmark_params
      params.require(:bookmark).permit(:list_id, :user_id, user:[:name, :id],
                                        list: [:id, :name])
    end
end
