class AdminsController < ApplicationController
  def index
    @user_list = User.all
    render 'admin_login'
  end

  def create
    name = params[:admin][:name]
    password = params[:admin][:password]
    
    if name == 'admin' && password == 'admin' # 先写死
      # 管理员成功登陆
      admin_login(name)
      @user_list = User.all
      render 'show_users'
    else
      # 管理员账号密码错误
      flash[:danger] = '用户名或密码错误！'
      render 'admin_login'
    end
  end

  def destroy
    admin_logout
    redirect_to root_url
  end

end
