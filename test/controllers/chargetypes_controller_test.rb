require 'test_helper'

class ChargetypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chargetype = chargetypes(:one)
  end

  test "should get index" do
    get chargetypes_url
    assert_response :success
  end

  test "should get new" do
    get new_chargetype_url
    assert_response :success
  end

  test "should create chargetype" do
    assert_difference('Chargetype.count') do
      post chargetypes_url, params: { chargetype: { charge_description: @chargetype.charge_description, code: @chargetype.code } }
    end

    assert_redirected_to chargetype_url(Chargetype.last)
  end

  test "should show chargetype" do
    get chargetype_url(@chargetype)
    assert_response :success
  end

  test "should get edit" do
    get edit_chargetype_url(@chargetype)
    assert_response :success
  end

  test "should update chargetype" do
    patch chargetype_url(@chargetype), params: { chargetype: { charge_description: @chargetype.charge_description, code: @chargetype.code } }
    assert_redirected_to chargetype_url(@chargetype)
  end

  test "should destroy chargetype" do
    assert_difference('Chargetype.count', -1) do
      delete chargetype_url(@chargetype)
    end

    assert_redirected_to chargetypes_url
  end
end
