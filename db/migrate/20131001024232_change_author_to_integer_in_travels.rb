class ChangeAuthorToIntegerInTravels < ActiveRecord::Migration
  def up
    remove_column :travels, :author
    add_column :travels, :user_id, :integer
    remove_column :foods, :author
    add_column :foods, :user_id, :integer
  end

  def down
    remove_column :foods, :user_id
    add_column :foods, :author, :string
    remove_column :travels, :user_id
    add_column :travels, :author, :string
  end
end
