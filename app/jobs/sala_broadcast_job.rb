class SalaBroadcastJob < ApplicationJob
  queue_as :default
 
  def perform(message)
    ActionCable.server.broadcast 'sala_channel', message: render_message(message)
  end
 
  private

  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end
end
