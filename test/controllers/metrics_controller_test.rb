require 'test_helper'

class MetricsControllerTest < ActionController::TestCase
  setup do
    @metric = metrics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:metrics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create metric" do
    assert_difference('Metric.count') do
      post :create, metric: { airport_id: @metric.airport_id, baggage_damaged_actual: @metric.baggage_damaged_actual, baggage_damaged_target: @metric.baggage_damaged_target, baggage_delayed_actual: @metric.baggage_delayed_actual, baggage_delayed_target: @metric.baggage_delayed_target, baggage_overall_actual: @metric.baggage_overall_actual, baggage_overall_target: @metric.baggage_overall_target, baggage_pilfered_actual: @metric.baggage_pilfered_actual, baggage_pilfered_target: @metric.baggage_pilfered_target, door_opening_dot3_actual: @metric.door_opening_dot3_actual, door_opening_dot3_target: @metric.door_opening_dot3_target, door_opening_dot5_actual: @metric.door_opening_dot5_actual, door_opening_dot5_target: @metric.door_opening_dot5_target, otp_all_d0_actual: @metric.otp_all_d0_actual, otp_all_d0_target: @metric.otp_all_d0_target, otp_all_d15_actual: @metric.otp_all_d15_actual, otp_all_d15_target: @metric.otp_all_d15_target, otp_exc_d0_actual: @metric.otp_exc_d0_actual, otp_exc_d0_target: @metric.otp_exc_d0_target, otp_exc_d15_actual: @metric.otp_exc_d15_actual, otp_exc_d15_target: @metric.otp_exc_d15_target, xplane_boarding_actual: @metric.xplane_boarding_actual, xplane_boarding_target: @metric.xplane_boarding_target, xplane_checkin_actual: @metric.xplane_checkin_actual, xplane_checkin_target: @metric.xplane_checkin_target }
    end

    assert_redirected_to metric_path(assigns(:metric))
  end

  test "should show metric" do
    get :show, id: @metric
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @metric
    assert_response :success
  end

  test "should update metric" do
    patch :update, id: @metric, metric: { airport_id: @metric.airport_id, baggage_damaged_actual: @metric.baggage_damaged_actual, baggage_damaged_target: @metric.baggage_damaged_target, baggage_delayed_actual: @metric.baggage_delayed_actual, baggage_delayed_target: @metric.baggage_delayed_target, baggage_overall_actual: @metric.baggage_overall_actual, baggage_overall_target: @metric.baggage_overall_target, baggage_pilfered_actual: @metric.baggage_pilfered_actual, baggage_pilfered_target: @metric.baggage_pilfered_target, door_opening_dot3_actual: @metric.door_opening_dot3_actual, door_opening_dot3_target: @metric.door_opening_dot3_target, door_opening_dot5_actual: @metric.door_opening_dot5_actual, door_opening_dot5_target: @metric.door_opening_dot5_target, otp_all_d0_actual: @metric.otp_all_d0_actual, otp_all_d0_target: @metric.otp_all_d0_target, otp_all_d15_actual: @metric.otp_all_d15_actual, otp_all_d15_target: @metric.otp_all_d15_target, otp_exc_d0_actual: @metric.otp_exc_d0_actual, otp_exc_d0_target: @metric.otp_exc_d0_target, otp_exc_d15_actual: @metric.otp_exc_d15_actual, otp_exc_d15_target: @metric.otp_exc_d15_target, xplane_boarding_actual: @metric.xplane_boarding_actual, xplane_boarding_target: @metric.xplane_boarding_target, xplane_checkin_actual: @metric.xplane_checkin_actual, xplane_checkin_target: @metric.xplane_checkin_target }
    assert_redirected_to metric_path(assigns(:metric))
  end

  test "should destroy metric" do
    assert_difference('Metric.count', -1) do
      delete :destroy, id: @metric
    end

    assert_redirected_to metrics_path
  end
end
