class CreateAdhocCancellations < ActiveRecord::Migration
  def change
    create_table :adhoc_cancellations do |t|
      t.date :date

      t.timestamps null: false
    end
  end
end
