class Story < ActiveRecord::Base
  include TagListable
  include Spammable

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :responses, dependent: :destroy
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings

  validates :body, presence: true
  validates :title, presence: true
  validates :user, presence: true

  paginates_per 6

  def self.recent
    order(created_at: :desc)
  end

  def self.spam
    where(spam: true)
  end
end
