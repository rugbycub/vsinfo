class Airport < ActiveRecord::Base
	self.primary_key = 'code'
	has_many :operations, primary_key: "code"
	has_many :employees, primary_key: "code"
	has_many :weekly_schedules, through: :employees
	has_secure_password
end
