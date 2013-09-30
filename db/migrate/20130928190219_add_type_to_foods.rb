class AddTypeToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :rest, :boolean
    add_column :foods, :recipe, :boolean
  end
end
