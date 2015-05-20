class LocaleController < ApplicationController
	def update
		session[:locale] = params[:locale]
		redirect_to "/"
	end
end