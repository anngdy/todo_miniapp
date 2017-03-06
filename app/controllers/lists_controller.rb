class ListsController < ApplicationController
  #before_filter :authenticate_user
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.where(user_id: current_user.id)
  end

  def show
    @tasks = Task.where(list_id: @list.id)
  end

  def new
    @list = List.new
  end

  def edit
  end

  def create
    @errors = {}

    params = list_params

    @list = List.new(params)
    @list.user_id = current_user.id


    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @errors = {}
    params = list_params

    res = @list.update(params)
    respond_to do |format|
      if res && @list.errors.blank?
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @errors = {}
    res = @list.destroy

    respond_to do |format|
      if res && @list.errors.blank?
        format.html { redirect_to @list, notice: 'List was successfully destroyed!' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def public
    @public = List.where(user_id: user).where(privacy: false)
  end

  #def complete_task?
  #  task = Task.find(params[:id])
  #  task.complete = !task.complete
  #  task.save!  
  #  
  #  respond_to do |format| 
  #    format.json {
  #      render json: task
  #    }
  #  end
  #end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:user_id, :name, :privacy, :status, :description, 
                                    user:[:name, :id], task:[:id, :list_id, :title, :note, :completed])
    end
end
