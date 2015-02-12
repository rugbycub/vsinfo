module Dashing
  module ApplicationHelper
  	def preload_city_dashboard(airport_code)
      @airport = Airport.find(airport_code.upcase)
      
      determine_operation

      @turns = @operation.turns
      Dashing.scheduler.in '20s' do
        @sked = @airport.weekly_schedules
        @metrics = @airport.metrics.last
        send_positions

        send_metrics

        @turns.each_with_index do |turn, index|
          @departure = turn.departure
          @arrival = turn.arrival
          @airplane = turn.airplane

          send_flifo(turn, index)

          send_arrival(index)

          send_departure(index)

          send_notes(index)
        end
      end

      Dashing.scheduler.every '1m', first_in: 1.second.since, allow_overlapping: false do
        send_ticker
      end
    end

    def send_ticker
      ticker_items = []
      @airport.tickers.each {|ticker| ticker_items.push(ticker.ticker_item.to_s)}
      Dashing.send_event "#{@airport.code.downcase}_ticker", { 
        items: ticker_items 
      }
    end

    def send_positions
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
    end

    def determine_operation
      if @airport.operations.where(date: Date.today).count != 0
        @operation = @airport.operations.where(date: Date.today).first
      else
        @operation = @airport.operations.last
      end
    end

    def send_departure (index)
      Dashing.send_event("departure_#{index}_#{@airport.code.downcase}", {
        flight_number: @departure.flight_number,
        std: @departure.std.strftime("%H:%M"),
        etd: @departure.etd.strftime("%H:%M"),
        captain: @departure.captain,
        fsm: @departure.fsm,
        j_capacity: @airplane.j_capacity.to_i,
        w_capacity: @airplane.w_capacity.to_i,
        y_capacity: @airplane.y_capacity.to_i,
        total_capacity: @airplane.total_capacity.to_i,
        j_value: @departure.j_booked,
        w_value: @departure.w_booked,
        y_value: @departure.y_booked,
        total_value: @departure.total_booked,
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
    end

    def send_arrival (index)
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
    end


    def send_flifo (turn, index)
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
    end

    def send_notes (index)
      Dashing.send_event("notes_#{index}_#{@airport.code}", { notes_content: "NOTES" })
    end

    def send_metrics
      Dashing.send_event "baggage_overall_#{@airport.code.downcase}", { 
        value: @metrics.baggage_overall_actual,
        target: @metrics.baggage_overall_target
      }

      Dashing.send_event "baggage_delayed_#{@airport.code.downcase}", { 
        value: @metrics.baggage_delayed_actual,
        target: @metrics.baggage_delayed_target
      }

      Dashing.send_event "baggage_damaged_#{@airport.code.downcase}", { 
        value: @metrics.baggage_damaged_actual,
        target: @metrics.baggage_damaged_target
      }

      Dashing.send_event "baggage_pilfered_#{@airport.code.downcase}", { 
        value: @metrics.baggage_pilfered_actual,
        target: @metrics.baggage_pilfered_target
      }

      Dashing.send_event "xplane_checkin_#{@airport.code.downcase}", { 
        value: @metrics.xplane_checkin_actual,
        target: @metrics.xplane_checkin_target
      }

      Dashing.send_event "xplane_boarding_#{@airport.code.downcase}", { 
        value: @metrics.xplane_boarding_actual,
        target: @metrics.xplane_boarding_target
      }

      Dashing.send_event "door_opening_d3_#{@airport.code.downcase}", { 
        value: @metrics.door_opening_dot3_actual,
        target: @metrics.door_opening_dot3_target
      }

      Dashing.send_event "door_opening_d5_#{@airport.code.downcase}", { 
        value: @metrics.door_opening_dot5_actual,
        target: @metrics.door_opening_dot5_target
      }

      Dashing.send_event "ad_d0_#{@airport.code.downcase}", { 
        value: @metrics.otp_all_d0_actual,
        target: @metrics.otp_all_d0_target
      }

      Dashing.send_event "ad_d15_#{@airport.code.downcase}", { 
        value: @metrics.otp_all_d15_actual,
        target: @metrics.otp_all_d15_target
      }

      Dashing.send_event "er_d0_#{@airport.code.downcase}", { 
        value: @metrics.otp_exc_d0_actual,
        target: @metrics.otp_exc_d0_target
      }

      Dashing.send_event "er_d15_#{@airport.code.downcase}", { 
        value: @metrics.otp_exc_d15_actual,
        target: @metrics.otp_exc_d15_target
      }
    end

  end
end
