class AddAcTypeToFlightSchedules < ActiveRecord::Migration
  def change
    add_column :flight_schedules, :ac_type, :string
  end
end
