class UsersController < ApplicationController

  before_filter :authenticate_admin
  
  def list
    @search = User.search(params[:search])
    @users = @search.paginate(:page => params[:page], :per_page => 15, :order => "created_at DESC")
  end
  
  def new
    @user = User.new if @user.nil?
  end
  
  def edit
    @user = User.find(params[:id]) if params[:id]
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to :action => 'list'
    else
      render 'new'
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to :action => 'list'
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    redirect_to :action => 'list'
  end


end
