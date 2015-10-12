class PicturesController < ApplicationController
	def index
		@pictures = Picture.all
	end
	def create
		for file in params[:picture][:files]
			p = Project.find(params[:picture][:project]).pictures.new
			p.file = file
			p.save!
		end
		redirect_to :back
	end
end