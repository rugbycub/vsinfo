class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.string :city
      t.date :date
      t.integer :staff_assignment

      t.timestamps null: false
    end
  end
end
