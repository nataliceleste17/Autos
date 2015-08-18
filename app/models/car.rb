class Car < ActiveRecord::Base

	has_many :part
	scope :newest_first, lambda { order("car.created_at DESC")}


end
