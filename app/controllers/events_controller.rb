class EventsController < ApplicationController
	def index
		@events = Event.order(:when)
	end
	def create
		Event.create(params.require(:event).permit(:title, :description)).save
		redirect_to action: :index, notice: "event added!"
	end
	def update
		e = Event.find params["id"]
		e.update_attribute params["field"], params["value"]
		e.save
		render nothing: true, status: 200
	end
	def destroy
		Event.find(params[:id]).destroy
		redirect_to action: :index
	end

	def graphic_design
	end
end