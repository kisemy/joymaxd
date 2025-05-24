require 'test_helper'

class InternalSuppliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @internal_supply = internal_supplies(:one)
  end

  test "should get index" do
    get internal_supplies_url
    assert_response :success
  end

  test "should get new" do
    get new_internal_supply_url
    assert_response :success
  end

  test "should create internal_supply" do
    assert_difference('InternalSupply.count') do
      post internal_supplies_url, params: { internal_supply: { supplier_name: @internal_supply.supplier_name } }
    end

    assert_redirected_to internal_supply_url(InternalSupply.last)
  end

  test "should show internal_supply" do
    get internal_supply_url(@internal_supply)
    assert_response :success
  end

  test "should get edit" do
    get edit_internal_supply_url(@internal_supply)
    assert_response :success
  end

  test "should update internal_supply" do
    patch internal_supply_url(@internal_supply), params: { internal_supply: { supplier_name: @internal_supply.supplier_name } }
    assert_redirected_to internal_supply_url(@internal_supply)
  end

  test "should destroy internal_supply" do
    assert_difference('InternalSupply.count', -1) do
      delete internal_supply_url(@internal_supply)
    end

    assert_redirected_to internal_supplies_url
  end
end
