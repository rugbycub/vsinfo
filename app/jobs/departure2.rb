

Dashing.scheduler.every '5m', first_in: 1.second.since, allow_overlapping: false do |job|
  departure = Departure.first
  j_booked_percentage = (departure.j_booked / (departure.j_capacity * 1.25) * 100)
  w_booked_percentage = (departure.w_booked / (departure.w_capacity * 1.25) * 100)
  y_booked_percentage = (departure.y_booked / (departure.y_capacity * 1.25) * 100)
  total_booked_percentage = (departure.total_booked / (departure.total_capacity * 1.25) * 100)
  
  Dashing.send_event "departure2", {
    j_capacity: departure.j_capacity,
    w_capacity: departure.w_capacity, 
    y_capacity: departure.y_capacity, 
    total_capacity: departure.total_capacity, 
    flight_number: departure.flight_number, 
    std: departure.std, 
    etd: departure.etd, 
    captain: departure.captain, 
    fsm: departure.fsm, 
    j_booked: departure.j_booked, 
    w_booked: departure.w_booked, 
    y_booked: departure.y_booked, 
    total_booked: departure.total_booked, 
    j_booked_percentage: j_booked_percentage, 
    w_booked_percentage: w_booked_percentage, 
    y_booked_percentage: y_booked_percentage, 
    total_booked_percentage: total_booked_percentage, 
    j_meals: departure.j_meals, 
    w_meals: departure.w_meals, 
    y_meals: departure.y_meals, 
    total_meals: departure.total_meals, 
    j_sby: departure.j_sby, 
    w_sby: departure.w_sby, 
    y_sby: departure.y_sby, 
    total_sby: departure.total_sby, 
    specials: departure.specials, 
    date: departure.date
  }
end