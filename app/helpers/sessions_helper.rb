module SessionsHelper

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def current_user?(user)
    user == current_user
  end

  def admin_user
    admin = current_user.admin?
  end

  def deny_access
    store_location
    flash.keep[:notice]="Please sign in as admin to access this page."
    redirect_to login_path
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

  private
  
    def authenticate
      deny_access unless current_user
    end
    
    def authenticate_admin
      deny_access unless admin_user
    end

    def store_location
      session[:return_to] = request.fullpath
    end

    def clear_return_to
      session[:return_to] = nil
    end
  

end
