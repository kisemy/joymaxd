require 'test_helper'

class AcchartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @acchart = accharts(:one)
  end

  test "should get index" do
    get accharts_url
    assert_response :success
  end

  test "should get new" do
    get new_acchart_url
    assert_response :success
  end

  test "should create acchart" do
    assert_difference('Acchart.count') do
      post accharts_url, params: { acchart: { acc_name: @acchart.acc_name, accclass: @acchart.accclass, acctype: @acchart.acctype, balance: @acchart.balance, category: @acchart.category } }
    end

    assert_redirected_to acchart_url(Acchart.last)
  end

  test "should show acchart" do
    get acchart_url(@acchart)
    assert_response :success
  end

  test "should get edit" do
    get edit_acchart_url(@acchart)
    assert_response :success
  end

  test "should update acchart" do
    patch acchart_url(@acchart), params: { acchart: { acc_name: @acchart.acc_name, accclass: @acchart.accclass, acctype: @acchart.acctype, balance: @acchart.balance, category: @acchart.category } }
    assert_redirected_to acchart_url(@acchart)
  end

  test "should destroy acchart" do
    assert_difference('Acchart.count', -1) do
      delete acchart_url(@acchart)
    end

    assert_redirected_to accharts_url
  end
end
