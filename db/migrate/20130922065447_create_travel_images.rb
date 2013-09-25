class CreateTravelImages < ActiveRecord::Migration
  def change
    create_table :travel_images do |t|
      t.references  :travel
      t.string      :image
      t.string      :name
      t.text        :description
      t.boolean     :featured
      t.timestamps
    end
  end
end
