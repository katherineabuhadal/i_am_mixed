class User < ActiveRecord::Base
  has_many :stories, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :username, presence: true, uniqueness: true

  def like(story)
    likes.create(story_id: story.id)
  end

  def unlike(story)
    likes.find_by(story_id: story.id).destroy
  end

  def likes?(story)
    Like.exists?(story_id: story.id)
  end
end
