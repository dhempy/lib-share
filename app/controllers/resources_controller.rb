
class ResourcesController < ApplicationController

	
	def index 
		@resources = Resource.all
	end
	
	
	def show
		@resource = Resource.find(params[:id])
		# @resource.fetch_page
	end
	


	def new
		@resource = Resource.new
	end

	def create
		@resource = Resource.new(resource_params)  
		@resource.put_to_cache

		if @resource.save
			redirect_to @resource
		else
			render 'new'
		end
	end	


	
	def edit
		@resource = Resource.find(params[:id])
	end

	def update 
		@resource = Resource.find(params[:id])
		@resource.put_to_cache
		if @resource.update(resource_params)
			redirect_to @resource
		else
			render 'edit'
		end
	end
	
	def destroy
		@resource = Resource.find(params[:id])
		# Todo - purge from cache.
		@resource.destroy
		redirect_to resources_path
	end
		




	private

	def resource_params
		# params.permit(:url, :title, :comment)
		params.require(:resource).permit(:url, :title, :comment)
	end

end
