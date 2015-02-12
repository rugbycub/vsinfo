class TickersController < ApplicationController
  before_action :set_ticker, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @airport = Airport.find(params[:airport_id])
    @tickers = @airport.tickers.all
    respond_with(@tickers)
  end

  def show
    respond_with(@ticker)
  end

  def new
    @airport = Airport.find(params[:airport_id])
    @ticker = @airport.tickers.new
    respond_with(@ticker)
  end

  def edit_individual
    @ticker = WeeklySchedule.find(params[:ticker_ids])
  end

  def create
    @airport = Airport.find(params[:airport_id])
    @ticker = @airport.tickers.new(ticker_params)
    @ticker.save
    respond_with(@ticker)
  end

  def update_individual
    @ticker = Ticker.update(params[:ticker_ids].keys, params[:ticker_ids].values).reject { |p| p.errors.empty? }
    if @ticker.empty?
      flash[:notice] = "Tickers Updated"
      redirect_to airport_tickers_path
    else
      render :action => "edit_individual"
    end
  end

  def destroy
    @ticker.destroy
    respond_with(@ticker)
  end

  private
    def set_ticker
      @ticker = Ticker.find(params[:id])
    end

    def ticker_params
      params.require(:ticker).permit(:airport_id, :ticker_item)
    end
end
