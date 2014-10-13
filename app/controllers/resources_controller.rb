
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
		# @resource = Resource.new(params[:resource])

		@resource.save
		redirect_to @resource
	end	
	

	private

	def resource_params
		# params.permit(:url, :title, :comment)
		params.require(:resource).permit(:url, :title, :comment)
	end

end
