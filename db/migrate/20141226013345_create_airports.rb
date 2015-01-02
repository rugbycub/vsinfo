class CreateAirports < ActiveRecord::Migration
  def change
    create_table :airports, id: false do |t|
      t.string :code, null: false
      t.string :name
      t.string :city
      t.string :country
      t.string :latlon
      t.string :timezone

      t.timestamps null: false
    end
    add_index :airports, :code, unique: true
  end
end
