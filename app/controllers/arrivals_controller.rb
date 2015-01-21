class ArrivalsController < ApplicationController
  before_action :set_arrival, only: [:show, :edit, :update, :destroy]
  before_filter :authorize

  respond_to :html

  def index
    @arrivals = Arrival.all
    respond_with(@arrivals)
  end

  def show
    respond_with(@arrival)
  end

  def new
    @arrival = Arrival.new
    respond_with(@arrival)
  end

  def edit
  end

  def create
    @arrival = Arrival.new(arrival_params)
    @arrival.save
    respond_with(@arrival)
  end

  def update
    @arrival.update(arrival_params)
    respond_with(@arrival)
  end

  def destroy
    @arrival.destroy
    respond_with(@arrival)
  end

  private
    def set_arrival
      @arrival = Arrival.find(params[:id])
    end

    def arrival_params
      params.require(:arrival).permit(:flight_number, :sta, :eta, :captain, :fsm, :j_booked, :w_booked, :y_booked, :total_booked, :specials)
    end
end
