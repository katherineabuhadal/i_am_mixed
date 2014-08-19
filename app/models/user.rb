class User < ActiveRecord::Base
  has_many :stories, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :responses, dependent: :destroy
  has_many :sent_messages, foreign_key: "sender_id", class_name: "Message", dependent: :destroy
  has_many :received_messages, foreign_key: "receiver_id", class_name: "Message", dependent: :destroy
  has_many :forums
  has_many :topics, dependent: :destroy
  has_many :posts, dependent: :destroy

  has_one :profile, dependent: :destroy

  validates :email, presence: true, uniqueness: true, email_format: { message: "Please choose a valid email address" }
  validates :password_digest, presence: true
  validates :password_confirmation, length: { in: 5..20 }
  validates :username, presence: true, uniqueness: true, length: { in: 5..20 }
  has_secure_password

  def generate_token
    token = SecureRandom.hex(128)
    update_attributes(token: token)
  end

  def has_permission?(editable)
    admin? || created?(editable)
  end

  def created?(editable)
    id == editable.user_id
  end

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
