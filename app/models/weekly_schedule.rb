class WeeklySchedule < ActiveRecord::Base

	after_create :set_unassigned
  belongs_to :employee
  belongs_to :monday,  class_name: "Position", foreign_key: "monday_id"
  belongs_to :tuesday,  class_name: "Position"
  belongs_to :wednesday,  class_name: "Position"
  belongs_to :thursday,  class_name: "Position"
  belongs_to :friday,  class_name: "Position"
  belongs_to :saturday,  class_name: "Position"
  belongs_to :sunday,  class_name: "Position"


  def set_unassigned
  	self.monday = Position.where(name:"UNASSIGNED").first
  	self.tuesday = Position.where(name:"UNASSIGNED").first
  	self.wednesday = Position.where(name:"UNASSIGNED").first
  	self.thursday = Position.where(name:"UNASSIGNED").first
  	self.friday = Position.where(name:"UNASSIGNED").first
  	self.saturday = Position.where(name:"UNASSIGNED").first
  	self.sunday = Position.where(name:"UNASSIGNED").first
  	self.save
  end
end
