
class ResourcesController < ApplicationController

	
	def index 
		@resources = Resource.all
	end
	
	
	def show
		@resource = Resource.find(params[:id])
	end
	


	def new
		@resource = Resource.new
	end
	
	
	def create
		@resource = Resource.new(resource_params)  

		if @resource.save
			redirect_to @resource
		else
			render 'new'
		end
	end	
	

	private

	def resource_params
		# params.permit(:url, :title, :comment)
		params.require(:resource).permit(:url, :title, :comment)
	end

end
