class CreateFlightSchedules < ActiveRecord::Migration
  def change
    create_table :flight_schedules do |t|
      t.string :flight_number
      t.time :departure
      t.time :arrival
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.boolean :saturday
      t.boolean :sunday
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end
