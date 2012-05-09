class CreatePhotoCategories < ActiveRecord::Migration
  def change
    create_table :photo_categories do |t|

      t.timestamps
    end
  end
end
