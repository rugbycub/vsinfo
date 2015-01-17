class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :supervisor
      t.boolean :tco
      t.boolean :fmu
      t.boolean :ticketer
      t.string :airport_id

      t.timestamps null: false
    end
    
  end
end
