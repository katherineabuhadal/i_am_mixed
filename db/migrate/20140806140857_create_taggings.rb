class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.integer :taggable_id, null: false
      t.string :taggable_type, null: false
      t.integer :tag_id, null: false
    end
    add_index :taggings, [:taggable_id, :tag_id], unique: true
  end
end
