class User < ActiveRecord::Base
  has_many :stories, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :responses, dependent: :destroy
  has_many :sent_messages, foreign_key: "sender_id", class_name: "Message", dependent: :destroy
  has_many :received_messages, foreign_key: "receiver_id", class_name: "Message", dependent: :destroy
  has_many :forums
  has_many :topics
  has_many :posts, dependent: :destroy

  has_one :profile, dependent: :destroy

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
