class Story < ActiveRecord::Base
  include TagListable

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :responses, dependent: :destroy
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings

  validates :body, presence: true
  validates :title, presence: true
  validates :user, presence: true

  def self.recent
    order(created_at: :desc).limit(9)
  end
end
