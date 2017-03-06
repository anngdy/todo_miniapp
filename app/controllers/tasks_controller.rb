class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :complete_task]
  before_action :set_list
  
  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @errors = {}

    params = task_params

    @task = @list.tasks.create(params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @list, notice: 'Task was successfully add.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @list, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to @list, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def complete_task
    @task.update_attributes(date_completed: Time.now, completed: true)
    respond_to do |format|
      format.html{ redirect_to @list, notice: 'Task completed!!!'}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    def set_list
      @list = List.find(params[:list_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title, :content, :completed, :date_completed, :list_id, 
                                    list:[:name, :id, :user_id, :privacy, :description, :status])
    end
end
