class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.references  :food
      t.string      :ingredient_name      
      t.string      :quantity_used
      t.timestamps
    end
  end
end
