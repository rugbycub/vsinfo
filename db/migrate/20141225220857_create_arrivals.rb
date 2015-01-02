class CreateArrivals < ActiveRecord::Migration
  def change
    create_table :arrivals do |t|
      t.string :flight_number
      t.time :sta
      t.time :eta
      t.string :captain
      t.string :fsm
      t.integer :j_booked, default: 0
      t.integer :w_booked, default: 0
      t.integer :y_booked, default: 0
      t.integer :total_booked
      t.text :specials

      t.timestamps null: false
    end
  end
end
