App.chat = App.cable.subscriptions.create { channel: "ChatChannel", room_id: $("#room-info").data("room-id") },
  received: (data) ->
    $('#chat-table').html(data.content)

  new_message: (message) ->
    @perform 'create_message', {message: message}
