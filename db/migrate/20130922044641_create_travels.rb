class CreateTravels < ActiveRecord::Migration
  def change
    create_table :travels do |t|
      t.string    :title 
      t.text      :content
      t.datetime  :publish_date
      t.string    :author
      t.boolean   :published, :default => false
      t.string    :destination
      t.timestamps
    end
  end
end
