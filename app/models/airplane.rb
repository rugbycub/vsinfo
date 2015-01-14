class Airplane < ActiveRecord::Base
	self.primary_key = 'reg'
	has_many :turns, primary_key: 'reg'
	before_save :add_cabin
	def add_cabin
		self.total_capacity = self.j_capacity + self.w_capacity + self.y_capacity
	end
end
