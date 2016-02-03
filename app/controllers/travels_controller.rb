class TravelsController < ApplicationController
  
  before_filter :authenticate_admin, :only => [:manage, :list, :create, :update, :destroy]
  # before_filter :authenticate

  def index
    @travel_blogs = Travel.reorder("publish_date DESC").page(params[:page]).per_page(5)
    quotes = Quote.where(:travel => true).pluck(:id) 
    @quote = Quote.where(:id => quotes.sample).first if Quote.where(:id => quotes.sample).first
    @featured_blogs_one = Travel.featured_blogs.in_groups_of(3, false).first
    @featured_blogs_two = Travel.featured_blogs.in_groups_of(3, false).last
  end
  
  def new
    @travel_blog = Travel.new
    @travel_blog.travel_images.build
  end
  
  def edit
    @travel_blog = Travel.find(params[:id])    
  end
  
  def list
    @search = Travel.ransack(params[:search])
    @travel_blogs = @search.result.paginate(page: params[:page], per_page: params[12])    
  end
  
  def show
    @travel_blog = Travel.find(params[:id])
    @comment = @travel_blog.comments.build
    @comments = Comment.where(:travel_id => @travel_blog.id).order('created_at DESC')
    @images = @travel_blog.travel_images
    @featured_image = @travel_blog.travel_images.where(:featured => true)
    @all_but_featured_image = @images - [@featured_image.first]
    if request.path != travel_path(@travel_blog)
      redirect_to @travel_blog, status: :moved_permanently
    end
  end
  
  def create
    @travel_blog = Travel.new(travel_params)
    @travel_blog.user_id = current_user.id
    if @travel_blog.save
      redirect_to(:action => 'list')
    else
      render "manage"
    end
  end
    
  def update
    @travel_blog = Travel.find(params[:id])
    if @travel_blog.update_attributes(travel_params)
      redirect_to(:action => 'list')
    else
      render "manage"
    end    
  end
  
  def destroy
    Travel.find(params[:id]).destroy
    redirect_to :action => 'index'
  end
  

  private
  
      def travel_params
        params.require(:travel).permit(
        :title, 
        :content, 
        :publish_date, 
        :user_id, 
        :published, 
        :travel_images_attributes, 
        :destination, 
        :featured_blog,
        { travel_images_attributes: [:image, :name, :description, :featured, :image_cache, :travel_id] },
        { comments_attributes: [:content, :user_id, :commenter, :gallery_id, :travel_id, :food_id] },
        )
      end

end
