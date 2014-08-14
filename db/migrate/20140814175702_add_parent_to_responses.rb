class AddParentToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :parent_id, :integer, null: true
  end
end
