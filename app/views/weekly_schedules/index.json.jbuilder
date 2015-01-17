json.array!(@weekly_schedules) do |weekly_schedule|
  json.extract! weekly_schedule, :id, :employee_id, :monday_id, :tuesday_id, :wednesday_id, :thursday_id, :friday_id, :saturday_id, :sunday_id
  json.url weekly_schedule_url(weekly_schedule, format: :json)
end
