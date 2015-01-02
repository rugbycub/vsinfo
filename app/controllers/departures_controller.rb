class DeparturesController < ApplicationController
  before_action :set_departure, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @departures = Departure.all
    respond_with(@departures)
  end

  def show
    respond_with(@departure)
  end

  def new
    @departure = Departure.new
    respond_with(@departure)
  end

  def edit
  end

  def create
    @departure = Departure.new(departure_params)
    @departure.save
    respond_with(@departure)
  end

  def update
    @departure.update(departure_params)
    respond_with(@departure)
  end

  def destroy
    @departure.destroy
    respond_with(@departure)
  end

  private
    def set_departure
      @departure = Departure.find(params[:id])
    end

    def departure_params
      params.require(:departure).permit(:flight_number, :std, :etd, :captain, :fsm, :j_booked, :w_booked, :y_booked, :total_booked, :j_meals, :w_meals, :y_meals, :total_meals, :j_sby, :w_sby, :y_sby, :total_sby, :specials)
    end
end
