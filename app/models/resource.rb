class Resource < ActiveRecord::Base

	validates :url, presence: true, length: {minimum: 5 }

	dev put_to_cache
		puts "Todo: put_to_cache [" + url +"]"
	end
	

end
