
## Should these requires be somewhere else?  probably...
require 'rubygems'
require 'bundler/setup'
require 'aws-sdk'
require 'uuid'

class Resource < ActiveRecord::Base

	validates :url, presence: true, length: {minimum: 5 }

	def put_to_cache
		

		s3 = AWS::S3.new
		bucket_name = "lib-share-cache-00254b-9fdc5a"
		bucket = s3.buckets[bucket_name]
		object = bucket.objects.create('url.txt',self.url)
		
		self.comments += "Cache URL: " + object.url_for(:read)	
		
	end
	 

end
