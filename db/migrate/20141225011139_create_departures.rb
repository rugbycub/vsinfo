class CreateDepartures < ActiveRecord::Migration
  def change
    create_table :departures do |t|
      t.string :flight_number
      t.time :std
      t.time :etd
      t.string :captain
      t.string :fsm
      t.integer :j_booked, default: 0
      t.integer :w_booked, default: 0
      t.integer :y_booked, default: 0
      t.integer :total_booked
      t.integer :j_meals, default: 0
      t.integer :w_meals, default: 0
      t.integer :y_meals, default: 0
      t.integer :total_meals
      t.integer :j_sby, default: 0
      t.integer :w_sby, default: 0
      t.integer :y_sby, default: 0
      t.integer :total_sby
      t.text :specials
      t.date :date

      t.timestamps null: false
    end
  end
end
