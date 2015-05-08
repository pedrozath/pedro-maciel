class SessionsController < ApplicationController
	def create
		if params[:password] == ENV["PASSWORD"]
			session[:logged_in] = true
			redirect_to "/"
		else
			redirect_to action: new, alert: "senha errada"
		end
	end

	def new

	end
end
