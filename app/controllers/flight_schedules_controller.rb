class FlightSchedulesController < ApplicationController
  before_action :set_flight_schedule, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @flight_schedules = FlightSchedule.all
    respond_with(@flight_schedules)
  end

  def show
    respond_with(@flight_schedule)
  end

  def new
    @flight_schedule = FlightSchedule.new
    respond_with(@flight_schedule)
  end

  def edit
  end

  def create
    @flight_schedule = FlightSchedule.new(flight_schedule_params)
    @flight_schedule.save
    respond_with(@flight_schedule)
  end

  def update
    @flight_schedule.update(flight_schedule_params)
    respond_with(@flight_schedule)
  end

  def destroy
    @flight_schedule.destroy
    respond_with(@flight_schedule)
  end

  private
    def set_flight_schedule
      @flight_schedule = FlightSchedule.find(params[:id])
    end

    def flight_schedule_params
      params.require(:flight_schedule).permit(:departure, :arrival, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday, :start_date, :end_date)
    end
end
