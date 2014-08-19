class AddTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :token, :text, null: false, default: ""
    add_column :users, :confirmed, :boolean, null: false, default: false
    add_index :users, :token
  end
end
