class Tag < ActiveRecord::Base
  has_many :taggings, dependent: :destroy
  has_many :stories, through: :taggings, source: :taggable, source_type: "Story"
  has_many :profiles, through: :taggings, source: :taggable, source_type: "Profile"
end
