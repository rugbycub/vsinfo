class OperationsController < ApplicationController
  before_action :set_operation, only: [:show, :edit, :update, :destroy]

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
    date = "4/10/2015".to_date
    @operation = @airport.operations.new(date: date)
    departure_list = []
    departure_schedule = []
    arrival_list = []
    arrival_schedule = []
    turns_arr = []
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
      departure.save
      arrival = (turn.arrival = Arrival.create)
      arrival.flight = arrival_list[x]
      arrival.save
      turn_item = Hash.new
      turn_item["turn"] = turn
      turn_item["departure"] = departure
      turn_item["departure_sked"] = departure_schedule[x]
      turn_item["arrival"] = arrival
      turn_item["arrival_sked"] = arrival_schedule[x],
      turn_item["aircraft_options"] = ac_list_arr[x]
      turns_arr.push(turn_item)
    end

  end

  def edit
    @airport = Airport.find(params[:airport_id])
  end

  def create
    @airport = Airport.find(params[:airport_id])
    @operation = @airport.operations.new(operation_params)
    @operation.save
    respond_with(@operation)
  end

  def update
    @airport = Airport.find(params[:airport_id])
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
      params.require(:operation).permit(:airport_id, :date, :staff_assignment)
    end
end
