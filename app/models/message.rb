class Message < ActiveRecord::Base
  belongs_to :receiver, class_name: "User"
  belongs_to :sender, class_name: "User"

  validates :body, presence: true
  validates :receiver, presence: true
  validates :sender, presence: true
  validate :user_cannot_message_themselves

  private

  def user_cannot_message_themselves
    @errors.add(:base, "You cannnot send a message to yourself") if self.receiver == self.sender
  end
end
