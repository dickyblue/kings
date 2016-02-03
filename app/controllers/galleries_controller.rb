class GalleriesController < ApplicationController
  
  before_filter :authenticate_admin, :only => [:list, :new, :edit, :create, :update, :destroy]
  # before_filter :authenticate

  def list
    @search = Gallery.ransack(params[:search])
    #For metasearch, which is deprecated @galleries = @search.paginate(:page => params[:page], :per_page => 12).order("created_at DESC")
    @galleries = @search.result.paginate(page: params[:page], per_page: params[12])
    
  end
  
  def new
    @image = Gallery.new 
  end
  
  def edit
    @image = Gallery.find(params[:id]) 
  end
  
  def create
    @image = Gallery.new(gallery_params)
    if @image.save
      redirect_to :action => 'list'
    else
      render "new"
    end
  end
  
  def update
    @image = Gallery.find(params[:id])
    if @image.update_attributes(gallery_params)
      redirect_to admins_path
    else
      render "edit"
    end
  end

  def destroy
    Gallery.find(params[:id]).destroy
    redirect_to :action => 'list'
  end  
  
  def index
    @engagement = Gallery.where(:engagement => true).page(params[:page]).per_page(12)
    @cruise = Gallery.where(:wedding_cruise => true).page(params[:page]).per_page(12).order('id ASC')
    @wedding = Gallery.where(:wedding => true).page(params[:page]).per_page(12).order('id ASC')
    @travel_images = TravelImage.page(params[:page]).per_page(12).order('id DESC')
    @food_images = FoodImage.page(params[:page]).per_page(12).order('id DESC')
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
  
  def wedding
    @wedding = Gallery.where(:wedding => true).paginate(:page => params[:page], :per_page => 12, :order => "created_at DESC")
  end
  
  def travel_images
    @travel_images = TravelImage.paginate(:page => params[:page], :per_page => 3, :order => "created_at DESC")
  end
    
  private
  
      def gallery_params
        params.require(:gallery).permit(
        :image, 
        :description, 
        :featured, 
        :lodging, 
        :name, 
        :engagement, 
        :friend_upload, 
        :user_id, 
        :friend_uploader, 
        :wedding, 
        :wedding_cruise,
        { comments_attributes: [:content, :user_id, :commenter, :gallery_id, :travel_id, :food_id] },
        )
      end

end
