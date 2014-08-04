class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :story

  validates :story, presence: true
  validates :user, presence: true
end
