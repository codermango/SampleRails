class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Hello, 你好呀！#{@user.name}"
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    @user = User.find(params[:user])

    @user.destroy
    redirect_to admin_login_path
  end


  private 
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
