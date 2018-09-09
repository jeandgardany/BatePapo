class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :participantes
  has_many :messages, dependent: :destroy
  #has_many :salas, through: :participantes
  has_and_belongs_to_many: salas
  has_one :adm

def user_nome
	if self.user.blank?
		"Sem Cadastro"
	else
		self.user.nome
	end
end

end
