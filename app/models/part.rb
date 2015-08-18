class Part < ActiveRecord::Base

	belongs_to :car
	scope :sorted, lambda { order("subjects.position ASC")}

end
