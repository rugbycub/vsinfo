require 'test_helper'

class AirplanesControllerTest < ActionController::TestCase
  setup do
    @airplane = airplanes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:airplanes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create airplane" do
    assert_difference('Airplane.count') do
      post :create, airplane: { ac_type: @airplane.ac_type, ife: @airplane.ife, j_capacity: @airplane.j_capacity, name: @airplane.name, new_livery: @airplane.new_livery, reg: @airplane.reg, total_capacity: @airplane.total_capacity, w_capacity: @airplane.w_capacity, y_capacity: @airplane.y_capacity }
    end

    assert_redirected_to airplane_path(assigns(:airplane))
  end

  test "should show airplane" do
    get :show, id: @airplane
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @airplane
    assert_response :success
  end

  test "should update airplane" do
    patch :update, id: @airplane, airplane: { ac_type: @airplane.ac_type, ife: @airplane.ife, j_capacity: @airplane.j_capacity, name: @airplane.name, new_livery: @airplane.new_livery, reg: @airplane.reg, total_capacity: @airplane.total_capacity, w_capacity: @airplane.w_capacity, y_capacity: @airplane.y_capacity }
    assert_redirected_to airplane_path(assigns(:airplane))
  end

  test "should destroy airplane" do
    assert_difference('Airplane.count', -1) do
      delete :destroy, id: @airplane
    end

    assert_redirected_to airplanes_path
  end
end
