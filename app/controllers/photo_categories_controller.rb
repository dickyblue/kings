class PhotoCategoriesController < ApplicationController

  def manage
    @photo_category = PhotoCategory.new if @photo_category.nil?
    @photo_category = PhotoCategory.find(params[:id]) if params[:id]
  end
  
  def create
    @photo_category = PhotoCategory.new(params[:photo_category])
    if @photo_category.save
      redirect_to welcome_path
    else
      render "new"
    end
  end

  def update
    @photo_category = PhotoCategory.find(params[:id])
    if @photo_category.update_attributes(params[:photo_category])
      redirect_to welcome_path
    else
      render "manage"
    end
  end

  def destroy
    PhotoCategory.find(params[:id]).destroy
    redirect_to :action => 'list'
  end  

end
