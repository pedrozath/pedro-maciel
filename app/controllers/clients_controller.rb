class ClientsController < ApplicationController
    def create
        Client.create params[:client].permit(:name, :description)
        redirect_to :back
    end

    def destroy
        Client.find(params[:id]).destroy
        redirect_to :back
    end
end
