class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string  :image
      t.text    :description
      t.boolean :featured
      t.timestamps
    end
  end
end
