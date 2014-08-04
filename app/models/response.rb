class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :story

  validates :body, presence: true
  validates :user, presence: true
  validates :story, presence: true
end
