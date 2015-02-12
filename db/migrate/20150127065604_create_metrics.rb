class CreateMetrics < ActiveRecord::Migration
  def change
    create_table :metrics do |t|
      t.string :airport_id
      t.float :baggage_overall_actual
      t.float :baggage_delayed_actual
      t.float :baggage_damaged_actual
      t.float :baggage_pilfered_actual
      t.float :xplane_checkin_actual
      t.float :xplane_boarding_actual
      t.float :door_opening_dot3_actual
      t.float :door_opening_dot5_actual
      t.float :otp_all_d0_actual
      t.float :otp_all_d15_actual
      t.float :otp_exc_d0_actual
      t.float :otp_exc_d15_actual
      t.float :baggage_overall_target
      t.float :baggage_delayed_target
      t.float :baggage_damaged_target
      t.float :baggage_pilfered_target
      t.float :xplane_checkin_target
      t.float :xplane_boarding_target
      t.float :door_opening_dot3_target
      t.float :door_opening_dot5_target
      t.float :otp_all_d0_target
      t.float :otp_all_d15_target
      t.float :otp_exc_d0_target
      t.float :otp_exc_d15_target

      t.timestamps null: false
    end
  end
end
