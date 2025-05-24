require 'test_helper'

class SubCountiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sub_county = sub_counties(:one)
  end

  test "should get index" do
    get sub_counties_url
    assert_response :success
  end

  test "should get new" do
    get new_sub_county_url
    assert_response :success
  end

  test "should create sub_county" do
    assert_difference('SubCounty.count') do
      post sub_counties_url, params: { sub_county: { sub_county_code: @sub_county.sub_county_code, sub_county_name: @sub_county.sub_county_name } }
    end

    assert_redirected_to sub_county_url(SubCounty.last)
  end

  test "should show sub_county" do
    get sub_county_url(@sub_county)
    assert_response :success
  end

  test "should get edit" do
    get edit_sub_county_url(@sub_county)
    assert_response :success
  end

  test "should update sub_county" do
    patch sub_county_url(@sub_county), params: { sub_county: { sub_county_code: @sub_county.sub_county_code, sub_county_name: @sub_county.sub_county_name } }
    assert_redirected_to sub_county_url(@sub_county)
  end

  test "should destroy sub_county" do
    assert_difference('SubCounty.count', -1) do
      delete sub_county_url(@sub_county)
    end

    assert_redirected_to sub_counties_url
  end
end
