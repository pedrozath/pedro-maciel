module ApplicationHelper
	def logged_in
		return session[:logged_in]
	end
end
