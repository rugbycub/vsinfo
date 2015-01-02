class AirportsController < ApplicationController
  before_action :set_airport, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @airports = Airport.all
    respond_with(@airports)
  end

  def show
    respond_with(@airport)
  end

  def new
    @airport = Airport.new
    respond_with(@airport)
  end

  def edit
  end

  def create
    @airport = Airport.new(airport_params)
    @airport.save
    respond_with(@airport)
  end

  def update
    @airport.update(airport_params)
    respond_with(@airport)
  end

  def destroy
    @airport.destroy
    respond_with(@airport)
  end

  private
    def set_airport
      @airport = Airport.find(params[:id])
    end

    def airport_params
      params.require(:airport).permit(:code, :name, :city, :country, :latlon, :timezone)
    end
end
