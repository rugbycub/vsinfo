# widget configuration

unit_system   = "METRIC"
date_format   = "%H:%M"
animate_views = true

Dashing.scheduler.every "20m", first_in: 1.second.since do |job|
  fitbit = Departure.new
  if fitbit.errors?
    send_event "fitbit", { error: fitbit.error }
  else
    send_event "fitbit", {
      device:   fitbit.device,
      steps:    fitbit.steps,
      calories: fitbit.calories,
      distance: fitbit.distance,
      active:   fitbit.active,
      animate:  animate_views
    }
  end
end