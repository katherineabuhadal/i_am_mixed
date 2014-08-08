class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :user_id, null: false
      t.timestamps null: false
    end
    add_index :forums, :user_id
    add_index :forums, :name, unique: true
  end
end
