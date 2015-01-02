class CreateAirplanes < ActiveRecord::Migration
  def change
    create_table :airplanes do |t|
      t.string :reg, null: false
      t.string :ac_type
      t.string :name
      t.integer :j_capacity
      t.integer :w_capacity
      t.integer :y_capacity
      t.integer :total_capacity
      t.string :ife
      t.boolean :new_livery

      t.timestamps null: false
    end

    add_index :airplanes, :reg, unique: true
  end
end
