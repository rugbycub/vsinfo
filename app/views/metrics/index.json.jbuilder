json.array!(@metrics) do |metric|
  json.extract! metric, :id, :airport_id, :baggage_overall_actual, :baggage_delayed_actual, :baggage_damaged_actual, :baggage_pilfered_actual, :xplane_checkin_actual, :xplane_boarding_actual, :door_opening_dot3_actual, :door_opening_dot5_actual, :otp_all_d0_actual, :otp_all_d15_actual, :otp_exc_d0_actual, :otp_exc_d15_actual, :baggage_overall_target, :baggage_delayed_target, :baggage_damaged_target, :baggage_pilfered_target, :xplane_checkin_target, :xplane_boarding_target, :door_opening_dot3_target, :door_opening_dot5_target, :otp_all_d0_target, :otp_all_d15_target, :otp_exc_d0_target, :otp_exc_d15_target
  json.url metric_url(metric, format: :json)
end
