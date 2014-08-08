class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  belongs_to :forum

  accepts_nested_attributes_for :posts

  def replies
    replies = posts.count
    if replies > 0
      replies -1
    end
    replies
  end
end
