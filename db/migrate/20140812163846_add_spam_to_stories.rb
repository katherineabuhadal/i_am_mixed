class AddSpamToStories < ActiveRecord::Migration
  def change
    add_column :stories, :spam, :boolean, default: false, null: false
    add_column :stories, :spam_counter, :integer, default: 0, null: false
  end
end
