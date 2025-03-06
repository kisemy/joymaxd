require 'test_helper'

class PaymentlinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @paymentline = paymentlines(:one)
  end

  test "should get index" do
    get paymentlines_url
    assert_response :success
  end

  test "should get new" do
    get new_paymentline_url
    assert_response :success
  end

  test "should create paymentline" do
    assert_difference('Paymentline.count') do
      post paymentlines_url, params: { paymentline: { account_type: @paymentline.account_type, accountname: @paymentline.accountname, accountno: @paymentline.accountno, amount: @paymentline.amount, description: @paymentline.description, paying_account: @paymentline.paying_account, payment_id: @paymentline.payment_id } }
    end

    assert_redirected_to paymentline_url(Paymentline.last)
  end

  test "should show paymentline" do
    get paymentline_url(@paymentline)
    assert_response :success
  end

  test "should get edit" do
    get edit_paymentline_url(@paymentline)
    assert_response :success
  end

  test "should update paymentline" do
    patch paymentline_url(@paymentline), params: { paymentline: { account_type: @paymentline.account_type, accountname: @paymentline.accountname, accountno: @paymentline.accountno, amount: @paymentline.amount, description: @paymentline.description, paying_account: @paymentline.paying_account, payment_id: @paymentline.payment_id } }
    assert_redirected_to paymentline_url(@paymentline)
  end

  test "should destroy paymentline" do
    assert_difference('Paymentline.count', -1) do
      delete paymentline_url(@paymentline)
    end

    assert_redirected_to paymentlines_url
  end
end
