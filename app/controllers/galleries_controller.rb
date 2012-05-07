class GalleriesController < ApplicationController
  
  layout "gallery"

  def manage
    @image = Gallery.new if @image.nil?
    @image = Gallery.find(params[:id]) if params[:id]
  end
  
  def create
    @image = Gallery.new(params[:gallery])
    if @image.save
      redirect_to root_path
    else
      render "new"
    end
  end
  
  def update
    @image = Gallery.find(params[:id])
    if @image.update_attributes(params[:gallery])
      redirect_to root_path
    else
      render "edit"
    end
  end
  
    
  def show
    @images = Gallery.all
  end

end
