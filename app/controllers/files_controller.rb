class FilesController < ApplicationController
	def show
		@picture = Picture.find params[:id]
	end

	def create
		p = Picture.create params.permit(:file, :event_id)
		p.save
		render nothing: true, status: 200
	end
end