class SalaChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "sala_channel"

    #Subscription.find_or_create_by(sala_id: params[:sala_id], user: current_user)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    #Subscription.where(sala_id: params[:sala_id], user: current_user).destroy
  end

  def speak (data)
  #Message.create!(texto: data['message'], user_id: data['current_user'], sala_id: data[':sala_id'])
  #Message.create!(user_id: current_user, sala_id: params['sala_id'], texto: data['message'])
  current_user.messages.create!(texto: data['message'], sala_id: params[:sala_id])
  #current_user.messages.create!(texto: data['message'], sala_id: data['sala_id'])
  #ActionCable.server.broadcast('messages', {message: message.texto, user_id: message.user.name})
  #ActionCable.server.broadcast("messages_#{message_params[:sala_id]}")
  end
end
