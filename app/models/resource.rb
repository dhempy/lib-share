
require 'aws-sdk'
require 'open-uri'

class Resource < ActiveRecord::Base

	#attr_accessor   :url, :title, :comment
	attr_accessor :page 
	# attr_accessible :url, :title, :comment

	validates :url, presence: true, length: {minimum: 5 }

	
	def fetch_page
		@page = ''

		open(url) {  |f|
			# todo: figure out how to slurp entire file in one shot.
			f.each_line do |line|
				@page += line
			end

		}
	end


	def put_to_cache
		
		fetch_page

		s3 = AWS::S3.new
		bucket_name = "lib-share-cache-00254b-9fdc5a"
		bucket = s3.buckets[bucket_name]
		
		# Todo: actually fetch the content of the url's object.  But first, try try to create a simple file on s3.

		#fname = CGI.escape @url

#		fname = @url.gsub('/', '_')  # weak, but ok for prototype.  Better to use uuid and be done with it.

		fname = Time.now.to_s

		# Todo: Consider deleting old cached copy, or compare to see if it has changed.
		# Todo: Handle 404's better.

		object = bucket.objects.create(fname, @page)
		# object = bucket.objects.create('page',@page)
		
		## Todo: save URL for later retrieval

		@cache_url = object.url_for(:read) 
		
	end
	 

end
