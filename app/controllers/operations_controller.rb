class OperationsController < ApplicationController
  before_action :set_operation, only: [:show, :edit, :update, :destroy]
  before_filter :authorize

  respond_to :html

  def index
    @airport = Airport.find(params[:airport_id])
    @operations = @airport.operations.all
    respond_with(@operations)
  end

  def show
    @airport = Airport.find(params[:airport_id])
    @operation = @airport.operations.find(params[:id])
    respond_with(@operation)
  end

  def new
    @airport = Airport.find(params[:airport_id])
    date = Date.today
    @operation = @airport.operations.new(date: date)
    departure_list = []
    departure_schedule = []
    arrival_list = []
    arrival_schedule = []
    @turns_arr = []
    ac_list_arr = []
    @turns = []

    Flight.where(origin: @airport.code).each do |x|
      FlightSchedule.where(flight_number: x).where("start_date < ? AND end_date > ?", date, date).each do |departure|
        departure_list.push(x)
        departure_schedule.push(departure)
      end
    end

    Flight.where(destination: @airport.code).each do |x|
      FlightSchedule.where(flight_number: x).where("start_date < ? AND end_date > ?", date, date).each do |arrival|
        arrival_list.push(x)
        arrival_schedule.push(arrival)
      end
    end

    arrival_schedule.each do |arrival|
      plane_list = Airplane.where(ac_type: arrival.ac_type)
      ac_list_arr.push(plane_list)
    end

    arrival_list.count.times do |x|
      turn = @operation.turns.new(date: @operation.date)
      turn.airport = @operation.airport
      turn.save
      departure = (turn.departure = Departure.create)
      departure.flight = departure_list[x]
      departure.std = departure_schedule[x].departure
      departure.save
      arrival = (turn.arrival = Arrival.create)
      arrival.flight = arrival_list[x]
      arrival.sta = arrival_schedule[x].arrival
      arrival.save
      turn_item = Hash.new
      turn_item["turn"] = turn
      turn_item["departure"] = departure
      turn_item["departure_sked"] = departure_schedule[x]
      turn_item["arrival"] = arrival
      turn_item["arrival_sked"] = arrival_schedule[x]
      turn_item["aircraft_options"] = ac_list_arr[x]
      @turns_arr.push(turn_item)
      @turns.push(turn)
    end

  end

  def edit
    @airport = Airport.find(params[:airport_id])
    @operation = Operation.find(params[:id])
    @turns = @operation.turns
  end

  def create
    @airport = Airport.find(params[:airport_id])
    @operation = Operation.find(params[:id])
    params[:turn].each do |key, value|
      turn = Turn.find(key)
      turn.gate = value[:gate]
      airplane =  Airplane.find(value[:airplane])
      turn.airplane = airplane
      turn.save
    end
    Arrival.update(params[:arrival].keys, params[:arrival].values)
    Departure.update(params[:departure].keys, params[:departure].values)
    respond_with(@operation)
  end

  def update
    @airport = Airport.find(params[:airport_id])
    @operation = Operation.find(params[:id])
    params[:turn].each do |key, value|
      turn = Turn.find(key)
      turn.gate = value[:gate]
      airplane =  Airplane.find(value[:airplane])
      turn.airplane = airplane
      turn.save
    end
    Arrival.update(params[:arrival].keys, params[:arrival].values)
    Departure.update(params[:departure].keys, params[:departure].values)
    respond_to do |f|
      f.html { redirect_to airport_operation_path(@airport,@operation), notice: 'Daily Operation Created' }
    end
  end

  def destroy
    @operation.destroy
    respond_with(@operation)
  end

  def determine_turns
    @turn = @operation.turns.new
    @turn.save
  end

  def send_to_dashboard
    @airport = Airport.find(params[:airport_id])
    @operation = Operation.find(params[:id])
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
        aircraft_name: @airplane.name ,
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
    redirect_to airport_operations_path(@airport), notice: 'Sent to Dashboard' 
  end


  private
    def set_operation
      @operation = Operation.find(params[:id])
    end

    def operation_params
      params.require(:operation).permit(:airport_id, :date, :staff_assignment)
    end
end
