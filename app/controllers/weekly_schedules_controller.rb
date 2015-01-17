class WeeklySchedulesController < ApplicationController
  before_action :set_weekly_schedule, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
 @airport = Airport.find(params[:airport_id])
    @weekly_schedules = @airport.weekly_schedules.all
    @schedule_item = []
    @weekly_schedules.each do |x|
      individual_schedule = Hash.new
      individual_schedule["id"] = x.id
      individual_schedule["employee_name"] = x.employee.first_name + " " + x.employee.last_name
      individual_schedule["monday"] = x.monday.name
      individual_schedule["tuesday"] = x.tuesday.name
      individual_schedule["wednesday"] = x.wednesday.name
      individual_schedule["thursday"] = x.thursday.name
      individual_schedule["friday"] = x.friday.name
      individual_schedule["saturday"] = x.saturday.name
      individual_schedule["sunday"] = x.sunday.name
      @schedule_item.push(individual_schedule)
    end

    respond_with(@weekly_schedules, @schedule_item)

  end

  def show
    respond_with(@weekly_schedule)
  end

  def new
    @weekly_schedule = WeeklySchedule.new
    respond_with(@weekly_schedule)
  end

  def edit
  end

  def create
    @weekly_schedule = WeeklySchedule.new(weekly_schedule_params)
    @weekly_schedule.save
    respond_with(@weekly_schedule)
  end

  def update
    @weekly_schedule.update(weekly_schedule_params)
    respond_with(@weekly_schedule)
  end

  def destroy
    @weekly_schedule.destroy
    respond_with(@weekly_schedule)
  end

  def edit_individual
    @weekly_schedule = WeeklySchedule.find(params[:schedule_ids])
  end

  def update_individual
    @weekly_schedule = WeeklySchedule.update(params[:schedule_ids].keys, params[:schedule_ids].values).reject { |p| p.errors.empty? }
    if @weekly_schedule.empty?
      flash[:notice] = "Weekly Schedule Updated"
      redirect_to airport_weekly_schedules_path
    else
      render :action => "edit_individual"
    end
  end

  private
    def set_weekly_schedule
      @weekly_schedule = WeeklySchedule.find(params[:id])
    end

    def weekly_schedule_params
      params.require(:weekly_schedule).permit(:employee_id, :monday_id, :tuesday_id, :wednesday_id, :thursday_id, :friday_id, :saturday_id, :sunday_id)
    end
end
