class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string  :image
      t.string  :name
      t.text    :description
      t.boolean :featured
      t.boolean :lodging
      t.timestamps
    end
  end
end
