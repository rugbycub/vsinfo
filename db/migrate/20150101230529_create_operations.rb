class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.string :airport_id
      t.date :date
      t.integer :staff_assignment

      t.timestamps null: false
    end
  end
end
