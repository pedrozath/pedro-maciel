class TagsController < ApplicationController
    before_filter :authorizer
    def destroy
        Tag.find(params[:id]).destroy
        redirect_to :back
    end
end
