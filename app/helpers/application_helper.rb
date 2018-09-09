module ApplicationHelper
	def user_name
		if self.user.blank?
			"Sem Cadastro"
		else
			self.user.name
		end
	end

	def formatar_boolean(ativa)
		html = ""
		if ativa == true
			html = "Sim"
		elsif ativa == false
			html = "Não"
		end
		html
	end

	def flash_message
	    messages = ""
	    [:notice, :info, :warning, :error].each {|type|
	      if flash[type]
	        messages += "<p class=\"#{type}\">#{flash[type]}</p>"
	      end
	    }

	    messages
	end
end
