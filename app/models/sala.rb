class Sala < ApplicationRecord
	has_many :messages, dependent: :destroy
	belongs_to :adm, dependent: :destroy
	has_many :participantes
    has_many :solicitations, dependent: :destroy
	#has_and_belongs_to_many :users
	has_many :users, through: :participantes

	accepts_nested_attributes_for :messages, :solicitations, :adm, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :participantes, reject_if: proc { |attributes| attributes[:user_id].blank? }, allow_destroy: true
	accepts_nested_attributes_for :users
	#validates :adm, presence: true
	#validates :participante, uniqueness: true

	#def setar_sala
    #  @sala = current_user.salas.find(params[:id])
    #end
    def sala_id
    	self.sala_id =  Sala.find(params[:id])   	
    end

    def user_nome
    	if self.sala.blank?
      		"Sem Cadastro"
    	else
      		self.sala.user.nome
    	end
    end

    def solicitation_user_nome
        if self.solicitation.blank?
            "Sem Cadastro"
        else
            self.solicitation.user.nome
        end
    end

end
