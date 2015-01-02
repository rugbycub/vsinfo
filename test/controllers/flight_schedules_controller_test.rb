require 'test_helper'

class FlightSchedulesControllerTest < ActionController::TestCase
  setup do
    @flight_schedule = flight_schedules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:flight_schedules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create flight_schedule" do
    assert_difference('FlightSchedule.count') do
      post :create, flight_schedule: { arrival: @flight_schedule.arrival, departure: @flight_schedule.departure, end_date: @flight_schedule.end_date, friday: @flight_schedule.friday, monday: @flight_schedule.monday, saturday: @flight_schedule.saturday, start_date: @flight_schedule.start_date, sunday: @flight_schedule.sunday, thursday: @flight_schedule.thursday, tuesday: @flight_schedule.tuesday, wednesday: @flight_schedule.wednesday }
    end

    assert_redirected_to flight_schedule_path(assigns(:flight_schedule))
  end

  test "should show flight_schedule" do
    get :show, id: @flight_schedule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @flight_schedule
    assert_response :success
  end

  test "should update flight_schedule" do
    patch :update, id: @flight_schedule, flight_schedule: { arrival: @flight_schedule.arrival, departure: @flight_schedule.departure, end_date: @flight_schedule.end_date, friday: @flight_schedule.friday, monday: @flight_schedule.monday, saturday: @flight_schedule.saturday, start_date: @flight_schedule.start_date, sunday: @flight_schedule.sunday, thursday: @flight_schedule.thursday, tuesday: @flight_schedule.tuesday, wednesday: @flight_schedule.wednesday }
    assert_redirected_to flight_schedule_path(assigns(:flight_schedule))
  end

  test "should destroy flight_schedule" do
    assert_difference('FlightSchedule.count', -1) do
      delete :destroy, id: @flight_schedule
    end

    assert_redirected_to flight_schedules_path
  end
end
