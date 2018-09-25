class Solicitation < ApplicationRecord
  belongs_to :user
  belongs_to :sala

  accepts_nested_attributes_for :sala, :user

  def user_nome
	if self.user.blank?
		"Sem Cadastro"
	else
		self.user.nome
	end
  end
end
