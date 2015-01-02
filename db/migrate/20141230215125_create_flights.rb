class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.string :flight_number, null: false
      t.string :origin
      t.string :destination

      t.timestamps null: false
    end

    add_index :flights, :flight_number, unique: true
  end
end
