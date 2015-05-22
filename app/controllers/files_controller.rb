class FilesController < ApplicationController
	def index
		@events = Event.all.group_by do |e|
			Integer e["when"].strftime "%Y"
		end
		puts @events
	end
	
	def show
		@picture = Picture.find params[:id]
	end

	def create
		p = Picture.create params.permit(:file, :event_id)
		p.save
		render nothing: true, status: 200
	end
end