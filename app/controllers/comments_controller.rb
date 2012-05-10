class CommentsController < ApplicationController
  
  before_filter :authenticate_admin, :only => :destroy
  before_filter :authenticate
  
  def index
    @comment = Comment.new
    @comments = Comment.all
    @comment.user_id = current_user.id
    @comment.commenter = current_user.name
    @comments = Comment.paginate(:page => params[:page], :per_page => 10, :order => "created_at DESC")
  end
  
  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      redirect_to :action => 'index'   
    else
      render 'index'
    end
  end
  
  def destroy
    Comment.find(params[:id]).destroy
    redirect_to admins_path
  end

end
