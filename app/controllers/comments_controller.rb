class CommentsController < ApplicationController
  
  before_filter :authenticate_admin, :only => :destroy
  # before_filter :authenticate
  
  def index
    @comment = Comment.new
    @comments = Comment.all
    @comment.user_id = User.find(3) unless current_user.id
    @comment.commenter = current_user.name
    @comments = Comment.paginate(:page => params[:page], :per_page => 10, :order => "created_at DESC")
  end
  
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to :action => 'index'   
    else
      render 'index'
    end
  end
  
  def create_gallery_comment
    @images = Gallery.where(:friend_upload => true)
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to friend_photos_path
    else
      render friend_photos_path
    end
  end
  
  def create_travel_comment
    @travel_blog = Travel.find(params[:id])
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to travel_path(@travel_blog)
    else
      render travel_path(@travel_blog)
    end
  end
  
  def create_food_comment
    @food_blog = Food.find(params[:id])
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to food_path(@food_blog)
    else
      render food_path(@food_blog)
    end
  end
  
  def destroy
    Comment.find(params[:id]).destroy
    redirect_to admins_path
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(
    :content, 
    :user_id, 
    :commenter, 
    :gallery_id, 
    :travel_id, 
    :food_id
    )
  end

end
