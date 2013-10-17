class TravelsController < ApplicationController
  
  before_filter :authenticate_admin, :only => [:manage, :list, :create, :update, :destroy]
  before_filter :authenticate

  def index
    @travel_blogs = Travel.paginate(:page => params[:page], :per_page => 5, :order => "created_at DESC")
    quotes = Quote.where(:travel => true).pluck(:id) 
    @quote = Quote.where(:id => quotes.sample).first if Quote.where(:id => quotes.sample).first
    @featured_blogs_one = Travel.featured_blogs.in_groups_of(3, false).first
    @featured_blogs_two = Travel.featured_blogs.in_groups_of(3, false).last
  end
  
  def manage
    @travel_blog = Travel.new if @travel_blog.nil?
    @travel_blog.travel_images.build
    @travel_blog = Travel.find(params[:id]) if params[:id]
  end
  
  def list
    @search = Travel.search(params[:search])
    @travel_blogs = @search.paginate(:page => params[:page], :per_page => 12, :order => "created_at DESC")
  end
  
  def show
    @travel_blog = Travel.find(params[:id])
    @comment = @travel_blog.comments.build
    @comments = Comment.where(:travel_id => @travel_blog.id).order('created_at DESC')
    @images = @travel_blog.travel_images
    @featured_image = @travel_blog.travel_images.where(:featured => true)
    if request.path != travel_path(@travel_blog)
      redirect_to @travel_blog, status: :moved_permanently
    end
  end
  
  def create
    @travel_blog = Travel.new(params[:travel])
    if @travel_blog.save
      redirect_to(:action => 'list')
    else
      render "manage"
    end
  end
    
  def update
    @travel_blog = Travel.find(params[:id])
    if @travel_blog.update_attributes(params[:travel])
      redirect_to(:action => 'list')
    else
      render "manage"
    end    
  end
  
  def destroy
    Travel.find(params[:id]).destroy
    redirect_to :action => 'index'
  end
  

end
