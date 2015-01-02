class AirplanesController < ApplicationController
  before_action :set_airplane, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @airplanes = Airplane.all
    respond_with(@airplanes)
  end

  def show
    respond_with(@airplane)
  end

  def new
    @airplane = Airplane.new
    respond_with(@airplane)
  end

  def edit
  end

  def create
    @airplane = Airplane.new(airplane_params)
    @airplane.save
    respond_with(@airplane)
  end

  def update
    @airplane.update(airplane_params)
    respond_with(@airplane)
  end

  def destroy
    @airplane.destroy
    respond_with(@airplane)
  end

  private
    def set_airplane
      @airplane = Airplane.find(params[:id])
    end

    def airplane_params
      params.require(:airplane).permit(:reg, :ac_type, :name, :j_capacity, :w_capacity, :y_capacity, :total_capacity, :ife, :new_livery)
    end
end
