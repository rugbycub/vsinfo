class MetricsController < ApplicationController
  before_action :set_metric, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @metrics = Metric.all
    respond_with(@metrics)
  end

  def show
    respond_with(@metric)
  end

  def new
    @metric = Metric.new
    respond_with(@metric)
  end

  def edit
  end

  def create
    @metric = Metric.new(metric_params)
    @metric.save
    respond_with(@metric)
  end

  def update
    @metric.update(metric_params)
    respond_with(@metric)
  end

  def destroy
    @metric.destroy
    respond_with(@metric)
  end

  private
    def set_metric
      @metric = Metric.find(params[:id])
    end

    def metric_params
      params.require(:metric).permit(:airport_id, :baggage_overall_actual, :baggage_delayed_actual, :baggage_damaged_actual, :baggage_pilfered_actual, :xplane_checkin_actual, :xplane_boarding_actual, :door_opening_dot3_actual, :door_opening_dot5_actual, :otp_all_d0_actual, :otp_all_d15_actual, :otp_exc_d0_actual, :otp_exc_d15_actual, :baggage_overall_target, :baggage_delayed_target, :baggage_damaged_target, :baggage_pilfered_target, :xplane_checkin_target, :xplane_boarding_target, :door_opening_dot3_target, :door_opening_dot5_target, :otp_all_d0_target, :otp_all_d15_target, :otp_exc_d0_target, :otp_exc_d15_target)
    end
end
