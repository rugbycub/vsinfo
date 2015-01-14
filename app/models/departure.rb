# class Departure < ActiveRecord::Base
# 	attr_accessor :j_capacity, :w_capacity, :y_capacity, :total_capacity, :j_hash
	
# 	after_find :determine_capacity
# 	before_save :add_cabin
# 	before_update :add_cabin

# 	belongs_to :flight, class_name: "Flight",
# 						foreign_key: "flight_number"
# 	has_one :turn
# 	has_one :airplane, through: :turn

# 	def determine_capacity
# 		if self.airplane.blank? == false
# 			self.j_capacity = self.airplane.j_capacity
# 			self.w_capacity = self.airplane.w_capacity
# 			self.y_capacity = self.airplane.y_capacity
# 			self.total_capacity = self.j_capacity + self.w_capacity + self.y_capacity
# 		end
# 	end

# 	def add_cabin
# 		self.total_booked = self.j_booked + self.w_booked + self.y_booked
# 		self.total_meals = self.j_meals + self.w_meals + self.y_meals
# 		self.total_sby = self.j_sby + self.w_sby + self.y_sby	
# 	end


# end
