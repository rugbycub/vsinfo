class CreateWeeklySchedules < ActiveRecord::Migration
  def change
    create_table :weekly_schedules do |t|
      t.references :employee, index: true
      t.references :monday, references: :positions, index: true
      t.references :tuesday, references: :positions, index: true
      t.references :wednesday, references: :positions, index: true
      t.references :thursday, references: :positions, index: true
      t.references :friday, references: :positions, index: true
      t.references :saturday, references: :positions, index: true
      t.references :sunday, references: :positions, index: true

      t.timestamps null: false
    end
  end
end
