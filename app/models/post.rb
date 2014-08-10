class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user

  def self.recent
    order(created_at: :desc)
  end
end
