class Turn < ActiveRecord::Base
	belongs_to :airplane, class_name: "Airplane",
						 foreign_key: "reg"
	belongs_to :departure
	belongs_to :arrival
end
