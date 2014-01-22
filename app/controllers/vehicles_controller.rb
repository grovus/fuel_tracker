class VehiclesController < ApplicationController
	before_action :signed_in_user
	before_action :correct_user, only: :destroy

	def show
	  @vehicle = Vehicle.find(params[:id])
	end

	def new
	  @vehicle = Vehicle.new
	end

	def create
		@vehicle = current_user.vehicles.build(vehicle_params)
		if @vehicle.save
			flash[:success] = "Vehicle created!"
			redirect_to @vehicle
		else
			render 'new'
		end
	end

	def destroy
		@vehicle.destroy
		redirect_to root_url
	end

	def edit
	end

	def update
	end
 
 	private

    	def vehicle_params
    		params.require(:vehicle).permit(:name, :make, :model, :year, :odometer)
    	end

    	def correct_user
    		@vehicle = current_user.vehicles.find_by(id: params[:id])
    		redirect_to root_url if @vehicle.nil?
    	end
end