class GalleriesController < ApplicationController
  
  before_filter :authenticate_admin, :only => [:list, :manage, :create, :update, :destroy]
  before_filter :authenticate
  layout "gallery"

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
    @images = Gallery.all - @lodgings - @engagements
    @first_image = @images.first 
  end
  
  def travel_lodging
    @images = Gallery.where(:lodging => true)
    @first_image = @images.first
  end
  
  def friend_upload
    @image = Gallery.new
    @image.user_id = current_user.id
    @image.friend_uploader = current_user.name
  end
  
  def create_friend_upload
    @image = Gallery.new(params[:gallery])
    if @image.save
      redirect_to friend_photos_path
    else
      render "friend_upload"
    end
  end
  
  def friend_photos
    @images = Gallery.where(:friend_upload => true)
  end
  

end
