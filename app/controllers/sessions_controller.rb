class SessionsController < ApplicationController
	def create
		session[:password] = params[:password]
		if view_context.logged_in
			redirect_to "/"
		else
			redirect_to action: new, alert: "senha errada"
		end
	end

	def new
	end

	def destroy
		session[:password] = nil
		redirect_to "/"
	end
end