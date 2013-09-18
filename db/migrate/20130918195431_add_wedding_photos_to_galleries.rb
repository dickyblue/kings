class AddWeddingPhotosToGalleries < ActiveRecord::Migration
  def change
    add_column  :galleries, :wedding_cruise,  :boolean
    add_column  :galleries, :wedding,         :boolean
  end
end
