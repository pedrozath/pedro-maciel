class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	before_action :apply_locale

	def apply_locale
		set_locale if location_not_set?
		puts session[:locale]
		I18n.locale = session[:locale] || :en
	end

	def set_locale
		session[:locale] = case request.location.country_code
			when "BR" then :pt_BR
			when "PT" then :pt_BR
			else "en"
		end
	end

	def location_not_set?
		!session.include? :locale
	end
end