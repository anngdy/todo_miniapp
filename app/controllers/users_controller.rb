class UsersController < ApplicationController
  before_action :set_available_product, only: [:show, :edit, :update, :destroy]

  def index  
  	@users = User.all
  end

  def new
  end

  def edit
  end

  def show
  end

  def create
  	@errors = {}
  	params = user_params

  	@user = User.new(params)

  	respond_to do |format|
  		format.js{
  			if @user.save
  				flash[:sucess] = 'User successfully created!'
  			else
  				@errors[:alert] = @user.errors.full_messages
  			end
  		}
  	end
  end

  def update
    @errors = {}
    params = user_params
    res = @user.update(params)
    respond_to do |format|
      format.js {
        if res && @user.errors.blank?
          flash[:sucess] = 'Usuário atualizado com sucesso!'
        else
          @errors[:alert] = @user.errors.full_messages
        end
      }
    end
  end

  def destroy
    @errors = {}
    res = @user.destroy!
    respond_to do |format|
      format.js {
        if res && @user.errors.blank?
          flash[:info] = 'Usuario deletado com sucesso!'
          sign_out
        else
          @errors[:alert] = @user.errors.full_messages
        end
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :username)
    end
end
