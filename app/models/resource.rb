class Resource < ActiveRecord::Base

	validates :url, presence: true, length: {minimum: 5 }

end
