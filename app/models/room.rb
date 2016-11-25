class Room < ApplicationRecord
  has_many :messages

  def rendering_messages
    self.messages.includes(:user).recent
  end
end
