class Employee < ActiveRecord::Base
  belongs_to :airport
  has_one :weekly_schedule
  has_many :positions, through: :weekly_schedules, foreign_key: :monday_id
  has_many :positions, through: :weekly_schedules, foreign_key: :tuesday_id
  has_many :positions, through: :weekly_schedules, foreign_key: :wednesday_id
  has_many :positions, through: :weekly_schedules, foreign_key: :thursday_id
  has_many :positions, through: :weekly_schedules, foreign_key: :friday_id
  has_many :positions, through: :weekly_schedules, foreign_key: :saturday_id
  has_many :positions, through: :weekly_schedules, foreign_key: :sunday_id
end