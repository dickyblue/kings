class FoodsController < ApplicationController

  def index
    @food_blogs = Food.order('publish_date DESC')
  end
  
  def manage
    @food_blog = Food.new if @food_blog.nil?
    5.times { @food_blog.food_images.build }
    @food_blog = Food.find(params[:id]) if params[:id]
  end
  
  def list
    @search = Food.search(params[:search])
    @food_blogs = @search.paginate(:page => params[:page], :per_page => 10, :order => "created_at DESC")
  end
  
  def show
    @food_blog = Food.find(params[:id])
    @comment = @food_blog.comments.build
    @comments = Comment.where(:food_id => @food_blog.id)
    @images = @food_blog.food_images
    @featured_image = @food_blog.food_images.where(:featured => true)
    if request.path != food_path(@food_blog)
      redirect_to @food_blog, status: :moved_permanently
    end
  end
  
  def create
    @food_blog = Food.new(params[:food])
    if @food_blog.save
      redirect_to(:action => 'list')
    else
      render "manage"
    end
  end
    
  def update
    @food_blog = Food.find(params[:id])
    if @food_blog.update_attributes(params[:food])
      redirect_to(:action => 'list')
    else
      render "manage"
    end    
  end
  
  def destroy
    Food.find(params[:id]).destroy
    redirect_to :action => 'index'
  end


end
