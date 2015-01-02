json.array!(@arrivals) do |arrival|
  json.extract! arrival, :id, :flight_number, :sta, :eta, :captain, :fsm, :j_booked, :w_booked, :y_booked, :total_booked, :specials
  json.url arrival_url(arrival, format: :json)
end
