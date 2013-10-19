class FoodsController < ApplicationController

  before_filter :authenticate_admin, :only => [:manage, :list, :create, :update, :destroy]
  before_filter :authenticate

  def index
    @food_blogs = Food.paginate(:page => params[:page], :per_page => 5, :order => "publish_date DESC")
    quotes = Quote.where(:food => true).pluck(:id)
    @quote = Quote.where(:id => quotes.sample).first if Quote.where(:id => quotes.sample).first
    @featured_blogs_one = Food.featured_blogs.in_groups_of(3, false).first
    @featured_blogs_two = Food.featured_blogs.in_groups_of(3, false).last
  end
  
  def manage
    @food_blog = Food.new if @food_blog.nil?
    1.times { @food_blog.food_images.build }
    recipe = @food_blog.recipes.build
    recipe.ingredients.build
    @food_blog = Food.find(params[:id]) if params[:id]
  end
  
  def list
    @search = Food.search(params[:search])
    @food_blogs = @search.paginate(:page => params[:page], :per_page => 12, :order => "created_at DESC")
  end
  
  def show
    @food_blog = Food.find(params[:id])
    @comment = @food_blog.comments.build
    @comments = Comment.where(:food_id => @food_blog.id).order('created_at DESC')
    @images = @food_blog.food_images
    @featured_image = @food_blog.food_images.where(:featured => true)
    @all_but_featured_image = @images - [@featured_image.first]
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
