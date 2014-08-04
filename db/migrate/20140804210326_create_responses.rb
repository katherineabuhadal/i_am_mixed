class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :user_id, null: false
      t.integer :story_id, null: false
      t.text :body, null: false
      t.timestamps null: false
    end
    add_index :responses, :user_id
    add_index :responses, :story_id
  end
end
