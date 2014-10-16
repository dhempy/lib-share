
require 'aws-sdk'

class Resource < ActiveRecord::Base

	validates :url, presence: true, length: {minimum: 5 }

	
	def fetch_resource_source
		uri = URI(self.url)
		source = Net::HTTP.get(uri) # => String	
	end

	def put_to_cache
		



		s3 = AWS::S3.new
		bucket_name = "lib-share-cache-00254b-9fdc5a"
		bucket = s3.buckets[bucket_name]
		
		# Todo: actually fetch the content of the url's object.  But first, try try to create a simple file on s3.

		object = bucket.objects.create('url.txt',self.url)
		
		# @comment += "Cached URL: " + object.url_for(:read)
		
	end
	 

end
