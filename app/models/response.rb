class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :story
  belongs_to :parent, class_name: 'Response'
  has_many :children, class_name: 'Response', foreign_key: 'parent_id', dependent: :destroy

  validates :body, presence: true
  validates :user, presence: true
  validates :story, presence: true
end
