require "test_helper"

class PositionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @position = positions(:one)
  end

  test "should get index" do
    get employee_positions_url
    assert_response :success
  end

  test "should get new" do
    get new_employee_position_url
    assert_response :success
  end

  test "should create position" do
    assert_difference("Position.count") do
      post employee_positions_url, params: { position: { title: @position.title } }
    end

    assert_redirected_to employee_position_url(Position.last)
  end

  test "should show position" do
    get employee_position_url(@position)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_position_url(@position)
    assert_response :success
  end

  test "should update position" do
    patch employee_position_url(@position), params: { position: { title: @position.title } }
    assert_redirected_to employee_position_url(@position)
  end

  test "should destroy position" do
    assert_difference("Position.count", -1) do
      delete employee_position_url(@position)
    end

    assert_redirected_to employee_positions_url
  end
end
