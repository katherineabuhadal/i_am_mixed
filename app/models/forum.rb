class Forum < ActiveRecord::Base
  has_many :topics, dependent: :destroy
end
