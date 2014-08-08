class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name, null: false
      t.integer :user_id, null: false
      t.integer :forum_id, null: false
      t.timestamps null: false
    end
    add_index :topics, :user_id
    add_index :topics, :forum_id
  end
end
