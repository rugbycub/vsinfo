require 'test_helper'

class AdhocCancellationsControllerTest < ActionController::TestCase
  setup do
    @adhoc_cancellation = adhoc_cancellations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:adhoc_cancellations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create adhoc_cancellation" do
    assert_difference('AdhocCancellation.count') do
      post :create, adhoc_cancellation: { date: @adhoc_cancellation.date }
    end

    assert_redirected_to adhoc_cancellation_path(assigns(:adhoc_cancellation))
  end

  test "should show adhoc_cancellation" do
    get :show, id: @adhoc_cancellation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @adhoc_cancellation
    assert_response :success
  end

  test "should update adhoc_cancellation" do
    patch :update, id: @adhoc_cancellation, adhoc_cancellation: { date: @adhoc_cancellation.date }
    assert_redirected_to adhoc_cancellation_path(assigns(:adhoc_cancellation))
  end

  test "should destroy adhoc_cancellation" do
    assert_difference('AdhocCancellation.count', -1) do
      delete :destroy, id: @adhoc_cancellation
    end

    assert_redirected_to adhoc_cancellations_path
  end
end
