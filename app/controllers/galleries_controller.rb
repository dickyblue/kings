class GalleriesController < ApplicationController
  
  before_filter :authenticate_admin, :only => [:list, :new, :edit, :create, :update, :destroy]
  before_filter :authenticate
  layout "gallery", :except => :home

  def home
    @featured_images = Gallery.where(:featured => true)
  end
  
  def list
    @search = Gallery.search(params[:search])
    @galleries = @search.paginate(:page => params[:page], :per_page => 12, :order => "created_at DESC")
  end
  
  def new
    @image = Gallery.new 
  end
  
  def edit
    @image = Gallery.find(params[:id]) 
  end
  
  def create
    @image = Gallery.new(params[:gallery])
    if @image.save
      redirect_to :action => 'list'
    else
      render "new"
    end
  end
  
  def update
    @image = Gallery.find(params[:id])
    if @image.update_attributes(params[:gallery])
      redirect_to admins_path
    else
      render "edit"
    end
  end

  def destroy
    Gallery.find(params[:id]).destroy
    redirect_to :action => 'list'
  end  
    
  def index3
    @lodgings = Gallery.where(:lodging => true)
    @engagements = Gallery.where(:engagement => true)
    @friends = Gallery.where(:friend_upload => true)
    @cruise = Gallery.where(:wedding_cruise => true)
    @wedding = Gallery.where(:wedding => true)
    @images = Gallery.all - @lodgings - @engagements - @cruise - @wedding 
    @first_image = @images.first 
  end
  
  def index
    @engagement = Gallery.where(:engagement => true).paginate(:page => params[:page], :per_page => 12, :order => "created_at DESC")
    @cruise = Gallery.where(:wedding_cruise => true).page(params[:page]).per_page(2)
    @wedding = Gallery.where(:wedding => true).page(params[:page]).per_page(2)
    # @all_images = Gallery.paginate(:page => params[:page], :per_page => 12, :order => "created_at DESC")
    @travel_images = TravelImage.page(params[:page]).per_page(2)
    @food_images = FoodImage.page(params[:page]).per_page(2)
    @image_type = params[:image_type]
    if @image_type == 'engagement'
      @images = @engagement
    elsif @image_type == 'wedding'
      @images = @wedding
    elsif @image_type == 'cruise'
      @images = @cruise
    elsif @image_type == 'travel'
      @images = @travel_images
    elsif @image_type == 'food'
      @images = @food_images
    end
  end
  
  def engagement
    @engagements = Gallery.where(:engagement => true).paginate(:page => params[:page], :per_page => 12, :order => "created_at DESC")
  end

  def wedding
    @wedding = Gallery.where(:wedding => true).paginate(:page => params[:page], :per_page => 12, :order => "created_at DESC")
  end
  
  def travel_images
    @travel_images = TravelImage.paginate(:page => params[:page], :per_page => 3, :order => "created_at DESC")
  end
  
  def travel_lodging
    @images = Gallery.where(:lodging => true)
    @first_image = @images.first
  end
    
  # def create_friend_upload
  #   @image = Gallery.create(params[:gallery])
  # end
  
  def friend_photos
    @image = Gallery.new
    @images = Gallery.where(:friend_upload => true)
    @comment = @image.comments.build
    @comments = Comment.where("gallery_id is not null")
  end
  
  def correct_photos
    @images = Gallery.where(:friend_upload => true)
    @image = Gallery.find(params[:id]) if params[:id]
  end
  

end
