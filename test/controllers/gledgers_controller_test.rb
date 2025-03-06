require 'test_helper'

class GledgersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gledger = gledgers(:one)
  end

  test "should get index" do
    get gledgers_url
    assert_response :success
  end

  test "should get new" do
    get new_gledger_url
    assert_response :success
  end

  test "should create gledger" do
    assert_difference('Gledger.count') do
      post gledgers_url, params: { gledger: { accountno: @gledger.accountno, amount: @gledger.amount, date: @gledger.date, description: @gledger.description, documentno: @gledger.documentno, sourceno: @gledger.sourceno, sourcetype: @gledger.sourcetype } }
    end

    assert_redirected_to gledger_url(Gledger.last)
  end

  test "should show gledger" do
    get gledger_url(@gledger)
    assert_response :success
  end

  test "should get edit" do
    get edit_gledger_url(@gledger)
    assert_response :success
  end

  test "should update gledger" do
    patch gledger_url(@gledger), params: { gledger: { accountno: @gledger.accountno, amount: @gledger.amount, date: @gledger.date, description: @gledger.description, documentno: @gledger.documentno, sourceno: @gledger.sourceno, sourcetype: @gledger.sourcetype } }
    assert_redirected_to gledger_url(@gledger)
  end

  test "should destroy gledger" do
    assert_difference('Gledger.count', -1) do
      delete gledger_url(@gledger)
    end

    assert_redirected_to gledgers_url
  end
end
