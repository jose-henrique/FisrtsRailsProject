class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(sanitize_para)
    if @user.save
      redirect_to @user, notice: "User created sussecsfull"
    else
      render new:, status: :unprocessable_entity
    end

  end

  private
    def sanitize_para
      params.require(:user).permit(:name, :email, :password, :password_confimation)
    end


end
