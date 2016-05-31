class TagsController < ApplicationController
    before_filter :authorize
    def destroy
        Tag.find(params[:id]).destroy
        redirect_to :back
    end
end
