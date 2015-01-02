require 'test_helper'

class DeparturesControllerTest < ActionController::TestCase
  setup do
    @departure = departures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:departures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create departure" do
    assert_difference('Departure.count') do
      post :create, departure: { captain: @departure.captain, etd: @departure.etd, flight_number: @departure.flight_number, fsm: @departure.fsm, j_booked: @departure.j_booked, j_meals: @departure.j_meals, j_sby: @departure.j_sby, specials: @departure.specials, std: @departure.std, total_booked: @departure.total_booked, total_meals: @departure.total_meals, total_sby: @departure.total_sby, w: @departure.w, w_meals: @departure.w_meals, w_sby: @departure.w_sby, y_booked: @departure.y_booked, y_meals: @departure.y_meals, y_sby: @departure.y_sby }
    end

    assert_redirected_to departure_path(assigns(:departure))
  end

  test "should show departure" do
    get :show, id: @departure
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @departure
    assert_response :success
  end

  test "should update departure" do
    patch :update, id: @departure, departure: { captain: @departure.captain, etd: @departure.etd, flight_number: @departure.flight_number, fsm: @departure.fsm, j_booked: @departure.j_booked, j_meals: @departure.j_meals, j_sby: @departure.j_sby, specials: @departure.specials, std: @departure.std, total_booked: @departure.total_booked, total_meals: @departure.total_meals, total_sby: @departure.total_sby, w: @departure.w, w_meals: @departure.w_meals, w_sby: @departure.w_sby, y_booked: @departure.y_booked, y_meals: @departure.y_meals, y_sby: @departure.y_sby }
    assert_redirected_to departure_path(assigns(:departure))
  end

  test "should destroy departure" do
    assert_difference('Departure.count', -1) do
      delete :destroy, id: @departure
    end

    assert_redirected_to departures_path
  end
end
