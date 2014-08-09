class Profile < ActiveRecord::Base
  include TagListable

  belongs_to :user
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings

  validates :user, presence: true

  delegate :username, to: :user

  has_attached_file :avatar, styles: { medium: "300x300>", small:"150x150", thumb: "100x100>" }, default_url: "missing_:style.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
