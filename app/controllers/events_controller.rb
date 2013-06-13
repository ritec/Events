class EventsController < ApplicationController
	def index
		@events = Event.upcoming
	end		
	
	#We pass data to views using instance variables like @events
	def show
	#Fail -> used to intercept the request and dump it i browser	
	#The params variable will intercept the values passed from
	#the url in this case :id
	@events = Event.find(params[:id])
	end

	def edit
		@events = Event.find(params[:id])
	end

	def new
		@events = Event.new
	end

	def create
		@events = Event.new(event_params)
		if @events.save
		  redirect_to @events
		else
			render :new
		end
	end

	def destroy
		@events = Event.find(params[:id])
		@events.destroy
		redirect_to events_url
	end

	def update
		@events = Event.find(params[:id])
		if @events.update(event_params)
			flash[:notice] = "Event successfully updated!"
			redirect_to @events
		else
			render :edit
		end
	end

	private 

	def event_params
		params.require(:event).
		permit(:namre, :description, :location, :price, :starts_at, :image_file_name, :capacity	 )
	end
end