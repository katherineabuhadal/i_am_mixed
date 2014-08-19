class AddTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :token, :text, null: false, default: ""
    add_index :users, :token
  end
end
