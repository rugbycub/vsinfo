class Flight < ActiveRecord::Base
	self.primary_key = 'flight_number'
	# has_many :flight_schedules
	# has_many :adhoc_cancellations, through: :flight_schedules
	# has_many :departures, primary_key: 'flight_number'
	# has_many :arrivals, primary_key: 'flight_number'
	# has_many :flight_schedules, primary_key: 'flight_number'
end
