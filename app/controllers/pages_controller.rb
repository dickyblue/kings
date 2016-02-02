class PagesController < ApplicationController

  # before_filter :authenticate

  def home
    @first_image = Gallery.where(:featured => true).first 
    @featured_images = Gallery.where(:featured => true) - [@first_image] 
  end
  
  def our_story
  end
  
  def weekend_schedule
    @images = Gallery.where(:lodging => true)
    @first_image = @images.first
  end

end
