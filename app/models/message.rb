class Message < ApplicationRecord
  after_create_commit { MessageBroadcastJob.perform_later self }
  belongs_to :user
  belongs_to :room

  validates :content, presence: true

  delegate :name, to: :user, prefix: true

  scope :recent, -> { order(id: :desc) }
  scope :older,  -> { order(:id) }

  def room_name
    "chat_#{room_id}"
  end
end
