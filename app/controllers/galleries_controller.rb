class GalleriesController < ApplicationController
  
  before_filter :authenticate_admin, :only => [:list, :manage, :create, :update, :destroy]
  before_filter :authenticate
  layout "gallery", :except => :home

  def home
    @featured_images = Gallery.where(:featured => true)
  end
  
  def list
    @search = Gallery.search(params[:search])
    @galleries = @search.paginate(:page => params[:page], :per_page => 10, :order => "created_at DESC")
  end
  
  def manage
    @image = Gallery.new if @image.nil?
    @image = Gallery.find(params[:id]) if params[:id]
  end
  
  def create
    @image = Gallery.new(params[:gallery])
    if @image.save
      redirect_to admins_path
    else
      render "new"
    end
  end
  
  def update
    @image = Gallery.find(params[:id])
    if @image.update_attributes(params[:gallery])
      redirect_to admins_path
    else
      render "manage"
    end
  end

  def destroy
    Gallery.find(params[:id]).destroy
    redirect_to :action => 'list'
  end  
    
  def index
    @lodgings = Gallery.where(:lodging => true)
    @engagements = Gallery.where(:engagement => true)
    @friends = Gallery.where(:friend_upload => true)
    @images = Gallery.all - @lodgings - @engagements - @friends 
    @first_image = @images.first 
  end
  
  def travel_lodging
    @images = Gallery.where(:lodging => true)
    @first_image = @images.first
  end
    
  def create_friend_upload
    @image = Gallery.create(params[:gallery])
  end
  
  def friend_photos
    @image = Gallery.new
    @images = Gallery.where(:friend_upload => true)
    @comment = @image.comments.build
    @comments = Comment.where("gallery_id is not null")
  end
  
  def correct_photos
    @images = Gallery.where(:friend_upload => true)
  end
  

end
