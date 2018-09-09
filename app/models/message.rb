class Message < ApplicationRecord
  after_create_commit { SalaBroadcastJob.perform_later self }
  #after_create_commit :broadcast_message
  #after_create_commit {MessageBroadcastJob.perform_now self}

  belongs_to :user
  belongs_to :sala

  accepts_nested_attributes_for :sala, reject_if: :all_blank, allow_destroy: true

  def sala_id
  	self.sala_id =  Sala.find(params[:id])   	
  end

  def setar_sala
      @sala = current_user.salas.find(params[:id])
  end

  private

  def broadcast_message
    MessageBroadcastJob.perform_later(self)
  end

end
