json.array!(@flight_schedules) do |flight_schedule|
  json.extract! flight_schedule, :id, :departure, :arrival, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday, :start_date, :end_date
  json.url flight_schedule_url(flight_schedule, format: :json)
end
