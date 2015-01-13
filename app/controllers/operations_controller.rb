class OperationsController < ApplicationController
  before_action :set_operation, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @operations = Operation.all
    respond_with(@operations)
  end

  def show
    respond_with(@operation)
  end

  def new
    city = params(:city)
    @airport = Airport.find(city)
    date = "4/10/2015".to_date
    @operation = @airport.operations.new(date: date)
    departure_list = []
    departure_schedule = []
    arrival_list = []
    arrival_schedule = []
    turns_arr = []
    ac_list_arr = []
    
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
      turn_item = Hash.new
      turn_item["departure"] = departure_list[x]
      turn_item["departure_sked"] = departure_schedule[x]
      turn_item["arrival"] = arrival_list[x]
      turn_item["arrival_sked"] = arrival_schedule[x],
      turn_item["aircraft_options"] = ac_list_arr[x]
      turns_arr.push(turn_item)
    end
    
    turns_arr.each do |x|
      turn = @operation.turns.new
      turn.airport = @operation.airport
      turn.save
      departure = (@turn.departure = Departure.new)
      arrival = (@turn.arrival = Arrival.new)
      departure.flight = x['departure']
      arival.flight = x['arrival']
      departure.save
      arrival.save
    end
  end

  def edit
  end

  def create
    @operation = Operation.new(operation_params)
    @operation.save
    respond_with(@operation)
  end

  def update
    @operation.update(operation_params)
    respond_with(@operation)
  end

  def destroy
    @operation.destroy
    respond_with(@operation)
  end

  def determine_turns
    @turn = @operation.turns.new
    @turn.save
  end

  private
    def set_operation
      @operation = Operation.find(params[:id])
    end

    def operation_params
      params.require(:operation).permit(:city, :date, :staff_assignment)
    end
end
