require "test_helper"

class Contracts::AllowancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contracts_allowance = contracts_allowances(:one)
  end

  test "should get index" do
    get contracts_allowances_url
    assert_response :success
  end

  test "should get new" do
    get new_contracts_allowance_url
    assert_response :success
  end

  test "should create contracts_allowance" do
    assert_difference("Contracts::Allowance.count") do
      post contracts_allowances_url, params: { contracts_allowance: {} }
    end

    assert_redirected_to contracts_allowance_url(Contracts::Allowance.last)
  end

  test "should show contracts_allowance" do
    get contracts_allowance_url(@contracts_allowance)
    assert_response :success
  end

  test "should get edit" do
    get edit_contracts_allowance_url(@contracts_allowance)
    assert_response :success
  end

  test "should update contracts_allowance" do
    patch contracts_allowance_url(@contracts_allowance), params: { contracts_allowance: {} }
    assert_redirected_to contracts_allowance_url(@contracts_allowance)
  end

  test "should destroy contracts_allowance" do
    assert_difference("Contracts::Allowance.count", -1) do
      delete contracts_allowance_url(@contracts_allowance)
    end

    assert_redirected_to contracts_allowances_url
  end
end
