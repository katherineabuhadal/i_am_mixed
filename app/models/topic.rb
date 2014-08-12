class Topic < ActiveRecord::Base
  include Spammable

  has_many :posts, dependent: :destroy
  belongs_to :forum

  accepts_nested_attributes_for :posts

  paginates_per 10

  def replies
    [posts.count - 1, 0].max
  end

  def self.recent
    order(created_at: :desc)
  end

  def self.spam
    where(spam: true)
  end
end
