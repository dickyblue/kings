class SessionsController < ApplicationController

  include SessionsHelper
  
  layout 'session'
  
  def new
    @page_title = "Sign in"
  end

  def create
    user = User.authenticate(params[:session][:email], params[:session][:password])
    if user
      user.update_attribute(:lastlogin, Time.now.in_time_zone)
      session[:user_id] = user.id
      redirect_to root_path   
    else
      flash[:notice] = "Invalid email / password combination."
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "You are logged out."
  end

end
