class SessionsController < ApplicationController
  def new

  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # 成功登陆
      log_in user
      redirect_to user
    else
      # 用户名或密码错误
      flash[:danger] = '用户名或密码错误！'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
