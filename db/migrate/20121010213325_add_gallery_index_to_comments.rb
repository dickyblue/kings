class AddGalleryIndexToComments < ActiveRecord::Migration
  def change
    add_index :comments, :gallery_id
  end
end
