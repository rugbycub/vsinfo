json.array!(@departures) do |departure|
  json.extract! departure, :id, :flight_number, :std, :etd, :captain, :fsm, :j_booked, :w, :y_booked, :total_booked, :j_meals, :w_meals, :y_meals, :total_meals, :j_sby, :w_sby, :y_sby, :total_sby, :specials
  json.url departure_url(departure, format: :json)
end
