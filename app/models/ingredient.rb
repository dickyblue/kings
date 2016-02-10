class Ingredient < ActiveRecord::Base

  # attr_accessible :ingredient_name, :quantity_used

  belongs_to :recipe

end
