class CreateTurns < ActiveRecord::Migration
  def change
    create_table :turns do |t|
      t.string :reg
      t.string :airport
      t.integer :arrival_id
      t.integer :departure_id
      t.string :gate
      t.date :date

      t.timestamps null: false
    end
  end
end
