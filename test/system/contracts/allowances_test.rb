require "application_system_test_case"

class Contracts::AllowancesTest < ApplicationSystemTestCase
  setup do
    @contracts_allowance = contracts_allowances(:one)
  end

  test "visiting the index" do
    visit contracts_allowances_url
    assert_selector "h1", text: "Allowances"
  end

  test "should create allowance" do
    visit contracts_allowances_url
    click_on "New allowance"

    click_on "Create Allowance"

    assert_text "Allowance was successfully created"
    click_on "Back"
  end

  test "should update Allowance" do
    visit contracts_allowance_url(@contracts_allowance)
    click_on "Edit this allowance", match: :first

    click_on "Update Allowance"

    assert_text "Allowance was successfully updated"
    click_on "Back"
  end

  test "should destroy Allowance" do
    visit contracts_allowance_url(@contracts_allowance)
    click_on "Destroy this allowance", match: :first

    assert_text "Allowance was successfully destroyed"
  end
end
