module ApplicationHelper
	def logged_in
		return session[:password] == ENV["PASSWORD"]
	end
end
