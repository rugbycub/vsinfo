module Dashing
  module ApplicationHelper
  	def preload_city_dashboard(airport_code)
      @airport = Airport.find(airport_code.upcase)
      if @airport.operations.where(date: Date.today).count != 0
      @operation = @airport.operations.where(date: Date.today).first
    else
      @operation = @airport.operations.last
    end

      @turns = @operation.turns

      @sked = @airport.weekly_schedules
      positions = Hash.new
      Position.all.each do |key|
        position_sked = @sked.where(:"#{@operation.date.strftime("%A").downcase}_id" => key.id.to_s)
        arr = positions["#{key.name.downcase}"] = []
        position_sked.each_with_index do |x, idx|
          arr.push((x.employee.first_name + " " + x.employee.last_name))
        end
      end

      Dashing.send_event "positions_#{@airport.code.downcase}", {
        supervisor: positions["supervisor"], 
        tco: positions["tco/flight prep"], 
        fmu: positions["fmu"], 
        ticketer: positions["ticketer/cashier"], 
        baggage: positions["baggage"], 
        clubhouse: positions["lounge"], 
        arrival_lead: positions["arrival lead"], 
        curb_y: positions["curb / y"], 
        gate_lead: positions["gate lead"], 
        j_cls: positions["j-cls"], 
        w_cls: positions["w-cls"], 
        y_cls: positions["y-cls"], 
        lobby: positions["lobby"], 
        bag_drop: positions["bag drop"]
      }

      @turns.each_with_index do |turn, index|
        @departure = turn.departure
        @arrival = turn.arrival
        @airplane = turn.airplane

        Dashing.send_event "flifo_#{index}_#{@airport.code.downcase}", {
          inbound_flight_number: @arrival.flight_number,
          outbound_flight_number: @departure.flight_number,
          registration: @airplane.reg,
          aircraft_type: @airplane.ac_type ,
          ac_name: @airplane.name ,
          j: @airplane.j_capacity,
          w: @airplane.w_capacity,
          y: @airplane.y_capacity,
          tob: @airplane.total_capacity,
          gate: turn.gate 
          }
        Dashing.send_event "arrival_#{index}_#{@airport.code.downcase}", {
          inbound_flight_number: @arrival.flight_number,
          sta: @arrival.sta.strftime("%H:%M"), 
          eta: @arrival.eta.strftime("%H:%M"),
          captain: @arrival.captain,
          fsm: @arrival.fsm,
          j: @arrival.j_booked,
          w: @arrival.w_booked,
          y: @arrival.y_booked,
          tob: @arrival.total_booked,
          specials: @arrival.specials
        } 
        Dashing.send_event("departure_#{index}_#{@airport.code.downcase}", {
          flight_number: @departure.flight_number,
          std: @departure.std.strftime("%H:%M"),
          etd: @departure.etd.strftime("%H:%M"),
          captain: @departure.captain,
          fsm: @departure.fsm,
          j_booked: @departure.j_booked,
          w_booked: @departure.w_booked,
          y_booked: @departure.y_booked,
          total_booked: @departure.total_booked,
          j_meals: @departure.j_meals,
          w_meals: @departure.w_meals,
          y_meals: @departure.y_meals,
          total_meals: @departure.total_meals,
          j_staff: @departure.j_sby,
          w_staff: @departure.w_sby,
          y_staff: @departure.y_sby,
          total_staff: @departure.total_sby,
          specials: @departure.specials 
          })
        Dashing.send_event("notes_#{index}_#{@airport.code}", { notes_content: "NOTES" })
      end
    end
  end
end
