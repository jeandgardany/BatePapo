class Sala < ApplicationRecord
	has_many :users
	has_many :messages
	belongs_to :adm
	has_many :participantes

	accepts_nested_attributes_for :messages, :adm, :users, :participantes
	#validates :adm, presence: true
	#validates :participante, uniqueness: true

	#def setar_sala
    #  @sala = current_user.salas.find(params[:id])
    #end
    def sala_id
    	self.sala_id =  Sala.find(params[:id])   	
    end

end
