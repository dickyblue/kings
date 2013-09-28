class CreateFoodImages < ActiveRecord::Migration
  def change
    create_table :food_images do |t|
      t.references  :food
      t.string      :image
      t.string      :name
      t.text        :description
      t.boolean     :featured
      t.timestamps
    end
  end
end
