class RegistrationsController < ApplicationController
	before_action :set_event

	def index
		
		@registrations = @events.registrations
	end

	def new 
	@registrations = @events.registrations.new
	end

	def create
		@registrations = @events.registrations.new(registration_params)
		if @registrations.save
			redirect_to event_registrations_path(@events),
			notice: "Thanks you are registered!"
		else
			render :new
		end
	end

	private
		def registration_params
			params.require(:registrations).permit(:name, :email, :how_heard)
		end

		def set_event
		@events = Event.find(params[:event_id]) 
		end
	

end
