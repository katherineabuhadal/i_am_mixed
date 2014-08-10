class Forum < ActiveRecord::Base
  has_many :topics, dependent: :destroy

  paginates_per 10
end
