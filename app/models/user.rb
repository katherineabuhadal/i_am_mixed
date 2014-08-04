class User < ActiveRecord::Base
  has_many :stories, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :username, presence: true, uniqueness: true
end
