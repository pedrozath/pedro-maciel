class SessionsController < ApplicationController
    def create
        session[:password] = params[:password]
        redirect_to "/"
    end

    def destroy
        session.delete :password
        redirect_to "/"
    end
end
