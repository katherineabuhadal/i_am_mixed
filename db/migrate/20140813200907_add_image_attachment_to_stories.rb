class AddImageAttachmentToStories < ActiveRecord::Migration
  def up
    remove_column :stories, :image
    add_attachment :stories, :image
  end

  def down
    add_column :stories, :image
    remove_attachment :stories, :image
  end
end
