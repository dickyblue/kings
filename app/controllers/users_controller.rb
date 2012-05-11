class UsersController < ApplicationController

  before_filter :authenticate_admin
  
  def list
    @search = User.search(params[:search])
    @users = @search.paginate(:page => params[:page], :per_page => 10, :order => "created_at DESC")
  end
  
  def manage
    @user = User.new if @user.nil?
    @user = User.find(params[:id]) if params[:id]
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to :action => 'list'
    else
      render 'manage'
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to :action => 'list'
    else
      render 'manage'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    redirect_to :action => 'list'
  end


end
