class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :image, null: false, default: ""
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.timestamps null: false
    end
    add_index :stories, :user_id
  end
end
