class ClientsController < ApplicationController
    before_filter :authorize
    def create
        Client.create params[:client].permit(:name, :description)
        redirect_to :back
    end

    def destroy
        Client.find_by(slug: params[:id]).destroy
        redirect_to :back
    end
end
