class FoodsController < ApplicationController

  before_filter :authenticate_admin, :only => [:manage, :list, :create, :update, :destroy]
  # before_filter :authenticate

  def index
    @food_blogs = Food.reorder("publish_date DESC").page(params[:page]).per_page(5)
    quotes = Quote.where(:food => true).pluck(:id)
    @quote = Quote.where(:id => quotes.sample).first if Quote.where(:id => quotes.sample).first
    @featured_blogs_one = Food.featured_blogs.in_groups_of(3, false).first
    @featured_blogs_two = Food.featured_blogs.in_groups_of(3, false).last
  end
  
  def new
    @food_blog = Food.new
    1.times { @food_blog.food_images.build }
    recipe = @food_blog.recipes.build
    recipe.ingredients.build
  end
  
  def edit
    @food_blog = Food.find(params[:id])    
  end
  
  def list
    @search = Food.ransack(params[:search])
    @food_blogs = @search.result.paginate(page: params[:page], per_page: params[12])
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
    @food_blog = Food.new(food_params)
    @food_blog.user_id = current_user.id
    if @food_blog.save
      redirect_to(:action => 'list')
    else
      render "manage"
    end
  end
    
  def update
    @food_blog = Food.find(params[:id])
    if @food_blog.update_attributes(food_params)
      redirect_to(:action => 'list')
    else
      render "manage"
    end    
  end
  
  def destroy
    Food.find(params[:id]).destroy
    redirect_to :action => 'index'
  end
  
  private
  
  def food_params
    params.require(:food).permit(
    :title, 
    :content, 
    :publish_date, 
    :user_id, 
    :published, 
    :restaurant, 
    :restaurant_location, 
    :rest, 
    :recipe, 
    :featured_blog,
    { food_images_attributes: [:image, :name, :description, :featured, :food_id] },
    { comments_attributes: [:content, :user_id, :commenter, :gallery_id, :travel_id, :food_id] },
    { recipes_attributes: [:name, :recipe_instructions, :ingredients_attributes, :food_id] },
    )
  end


end
