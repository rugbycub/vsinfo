require 'test_helper'

class ArrivalsControllerTest < ActionController::TestCase
  setup do
    @arrival = arrivals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:arrivals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create arrival" do
    assert_difference('Arrival.count') do
      post :create, arrival: { captain: @arrival.captain, eta: @arrival.eta, flight_number: @arrival.flight_number, fsm: @arrival.fsm, j_booked: @arrival.j_booked, specials: @arrival.specials, sta: @arrival.sta, total_booked: @arrival.total_booked, w_booked: @arrival.w_booked, y_booked: @arrival.y_booked }
    end

    assert_redirected_to arrival_path(assigns(:arrival))
  end

  test "should show arrival" do
    get :show, id: @arrival
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @arrival
    assert_response :success
  end

  test "should update arrival" do
    patch :update, id: @arrival, arrival: { captain: @arrival.captain, eta: @arrival.eta, flight_number: @arrival.flight_number, fsm: @arrival.fsm, j_booked: @arrival.j_booked, specials: @arrival.specials, sta: @arrival.sta, total_booked: @arrival.total_booked, w_booked: @arrival.w_booked, y_booked: @arrival.y_booked }
    assert_redirected_to arrival_path(assigns(:arrival))
  end

  test "should destroy arrival" do
    assert_difference('Arrival.count', -1) do
      delete :destroy, id: @arrival
    end

    assert_redirected_to arrivals_path
  end
end
