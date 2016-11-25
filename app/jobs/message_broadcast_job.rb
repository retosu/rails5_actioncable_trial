class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    html = rendered(message.room)
    ActionCable.server.broadcast message.room_name, content: html
  end

  private

  def rendered(room)
    ApplicationController.renderer.render( partial: 'rooms/messages', locals: { messages: room.rendering_messages })
  end
end
