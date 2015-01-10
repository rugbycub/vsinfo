class Operation < ActiveRecord::Base
	belongs_to :airport, class_name: "Airport",
						 foreign_key: "city"
	has_many :turns
end
