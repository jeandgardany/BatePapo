module ApplicationHelper
	def user_name
		if self.user.blank?
			"Sem Cadastro"
		else
			self.user.name
		end
	end
end
