module AdminsHelper
  def admin_login(name)
    @adminer = session[:admin_name] = name
  end
  
  def admin_logged_in?
    # debugger
    !session[:admin_name].nil?
  end

  def admin_logout
    session.delete(:admin_name)
    @adminer = nil
  end

end
