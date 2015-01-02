class FlightsController < ApplicationController
  before_action :set_flight, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @flights = Flight.all
    respond_with(@flights)
  end

  def show
    respond_with(@flight)
  end

  def new
    @flight = Flight.new
    respond_with(@flight)
  end

  def edit
  end

  def create
    @flight = Flight.new(flight_params)
    @flight.save
    respond_with(@flight)
  end

  def update
    @flight.update(flight_params)
    respond_with(@flight)
  end

  def destroy
    @flight.destroy
    respond_with(@flight)
  end

  private
    def set_flight
      @flight = Flight.find(params[:id])
    end

    def flight_params
      params.require(:flight).permit(:flight_number, :origin, :destination)
    end
end
