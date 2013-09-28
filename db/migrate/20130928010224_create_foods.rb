class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string    :title 
      t.text      :content
      t.datetime  :publish_date
      t.string    :author
      t.boolean   :published, :default => false
      t.string    :restaurant
      t.string    :restaurant_location
      t.timestamps
    end
  end
end
