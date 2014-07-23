require 'test_helper'

class PartLineItemsControllerTest < ActionController::TestCase
  setup do
    @part_line_item = part_line_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:part_line_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create part_line_item" do
    assert_difference('PartLineItem.count') do
      post :create, part_line_item: { part_id: @part_line_item.part_id, part_request_id: @part_line_item.part_request_id }
    end

    assert_redirected_to part_line_item_path(assigns(:part_line_item))
  end

  test "should show part_line_item" do
    get :show, id: @part_line_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @part_line_item
    assert_response :success
  end

  test "should update part_line_item" do
    patch :update, id: @part_line_item, part_line_item: { part_id: @part_line_item.part_id, part_request_id: @part_line_item.part_request_id }
    assert_redirected_to part_line_item_path(assigns(:part_line_item))
  end

  test "should destroy part_line_item" do
    assert_difference('PartLineItem.count', -1) do
      delete :destroy, id: @part_line_item
    end

    assert_redirected_to part_line_items_path
  end
end
