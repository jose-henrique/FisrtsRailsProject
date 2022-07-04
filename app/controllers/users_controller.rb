class UsersController < ApplicationController
  before_action :correct_user?, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(sanitize_para)
    if @user.save(validate: false)
      redirect_to @user, notice: "User created sussecsfull"
    else
      render new:, status: :unprocessable_entity
    end
  end


  def show
    
    @user = User.find(params[:id])

  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(sanitize_para)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    sign_out
    redirect_to root_path
  end


  private
    def sanitize_para
      params.require(:user).permit(:name, :password, :password_confirmation)
    end


end
