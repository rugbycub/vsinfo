class Departure < ActiveRecord::Base
	attr_accessor :foo
	belongs_to :flight, class_name: "Flight",
						foreign_key: "flight_number"
	has_one :turn
	before_save :add_cabin
	before_update :add_cabin
	has_one :airplane, through: :turn

	def add_cabin
		self.total_booked = self.j_booked + self.w_booked + self.y_booked
		
		self.total_meals = self.j_meals + self.w_meals + self.y_meals
		
		self.total_sby = self.j_sby + self.w_sby + self.y_sby

		
	end
end
