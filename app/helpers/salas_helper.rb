module SalasHelper
	def user_name
		if @sala.user_ids.blank?
			"Sem Cadastro"
		else
			@sala.users.find(params[:id])
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
