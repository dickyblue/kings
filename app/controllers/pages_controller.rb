class PagesController < ApplicationController

  before_filter :authenticate
  
  def our_story
  end
  
  def weekend_schedule
    @images = Gallery.where(:lodging => true)
    @first_image = @images.first
  end

end
