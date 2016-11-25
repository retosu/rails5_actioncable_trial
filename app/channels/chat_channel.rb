# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_#{params[:room_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def create_message(data)
    room = Room.find params[:room_id]
    Message.create! room: room, user: current_user, content: data['message']
#    ActionCable.server.broadcast "chat_#{params[:room_id]}", {name: current_user.name, content: data['message']}
  end
end
