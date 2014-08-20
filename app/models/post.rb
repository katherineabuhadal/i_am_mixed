class Post < ActiveRecord::Base
  include Spammable

  belongs_to :topic
  belongs_to :user

  validates :body, presence: true

  def self.recent
    order(created_at: :desc)
  end

  def self.spam
    where(spam: true)
  end
end
