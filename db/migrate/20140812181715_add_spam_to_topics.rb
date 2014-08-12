class AddSpamToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :spam_counter, :integer, default: 0, null: false
    add_column :topics, :spam, :boolean, default: false, null: false
  end
end
