class ApplicationController < ActionController::Base
	# protect_from_forgery with: :exception
    helper_method :admin?
    
    def admin?
         session[:password] == ENV["PASSWORD"]
    end

    def authorize
        def authorize
            redirect_to "/" unless admin?
        end
    end
end