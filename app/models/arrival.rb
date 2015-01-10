class Arrival < ActiveRecord::Base
	belongs_to :flight, class_name: "Flight",
						foreign_key: "flight_number"
	has_one :turn
	before_save :add_cabin
	before_update :add_cabin

	def add_cabin
		self.total_booked = self.j_booked + self.w_booked + self.y_booked
	end
end
