class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id, null: false
      t.date :birthday, null: false, default: "1900-01-01".to_date
      t.text :description, null: false, default: ""
      t.timestamps null: false
    end
    add_index :profiles, :user_id, unique: true
  end
end
