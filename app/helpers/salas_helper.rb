module SalasHelper
	def user_name
		if @sala.user_ids.blank?
			"Sem Cadastro"
		else
			@sala.users.find(params[:id])
		end
	end

end
