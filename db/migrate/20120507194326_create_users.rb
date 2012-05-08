class CreateUsers < ActiveRecord::Migration
  def change
    create_table  :users do |t|
      t.string    :name, :limit => 25
      t.string    :email, :limit => 75
      t.string    :password_salt
      t.string    :password_hash
      t.string    :password_reset_token
      t.datetime  :password_reset_sent_at
      t.boolean   :admin, :default => false
      t.timestamps
    end
    add_index :users, [:email], :unique => true
  end
end
