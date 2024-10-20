require "application_system_test_case"

class PositionsTest < ApplicationSystemTestCase
  setup do
    @position = positions(:one)
  end

  test "visiting the index" do
    visit employee_positions_url
    assert_selector "h1", text: "Positions"
  end

  test "should create position" do
    visit employee_positions_url
    click_on "New position"

    fill_in "Title", with: @position.title
    click_on "Create Position"

    assert_text "Position was successfully created"
    click_on "Back"
  end

  test "should update Position" do
    visit employee_position_url(@position)
    click_on "Edit this position", match: :first

    fill_in "Title", with: @position.title
    click_on "Update Position"

    assert_text "Position was successfully updated"
    click_on "Back"
  end

  test "should destroy Position" do
    visit employee_position_url(@position)
    click_on "Destroy this position", match: :first

    assert_text "Position was successfully destroyed"
  end
end
