require 'test_helper'

class PartRequestsControllerTest < ActionController::TestCase
  setup do
    @part_request = part_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:part_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create part_request" do
    assert_difference('PartRequest.count') do
      post :create, part_request: {  }
    end

    assert_redirected_to part_request_path(assigns(:part_request))
  end

  test "should show part_request" do
    get :show, id: @part_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @part_request
    assert_response :success
  end

  test "should update part_request" do
    patch :update, id: @part_request, part_request: {  }
    assert_redirected_to part_request_path(assigns(:part_request))
  end

  test "should destroy part_request" do
    assert_difference('PartRequest.count', -1) do
      delete :destroy, id: @part_request
    end

    assert_redirected_to part_requests_path
  end
end
