require 'test_helper'

class PaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payment = payments(:one)
  end

  test "should get index" do
    get payments_url
    assert_response :success
  end

  test "should get new" do
    get new_payment_url
    assert_response :success
  end

  test "should create payment" do
    assert_difference('Payment.count') do
      post payments_url, params: { payment: { account_type: @payment.account_type, amount: @payment.amount, category_type: @payment.category_type, documentno: @payment.documentno, mode_of_payment: @payment.mode_of_payment, payee_code: @payment.payee_code, payee_name: @payment.payee_name, paying_acc_description: @payment.paying_acc_description, paying_account_code: @payment.paying_account_code, payment_date: @payment.payment_date, payment_description: @payment.payment_description, posted: @payment.posted, prepared_by: @payment.prepared_by, release_date: @payment.release_date, status: @payment.status } }
    end

    assert_redirected_to payment_url(Payment.last)
  end

  test "should show payment" do
    get payment_url(@payment)
    assert_response :success
  end

  test "should get edit" do
    get edit_payment_url(@payment)
    assert_response :success
  end

  test "should update payment" do
    patch payment_url(@payment), params: { payment: { account_type: @payment.account_type, amount: @payment.amount, category_type: @payment.category_type, documentno: @payment.documentno, mode_of_payment: @payment.mode_of_payment, payee_code: @payment.payee_code, payee_name: @payment.payee_name, paying_acc_description: @payment.paying_acc_description, paying_account_code: @payment.paying_account_code, payment_date: @payment.payment_date, payment_description: @payment.payment_description, posted: @payment.posted, prepared_by: @payment.prepared_by, release_date: @payment.release_date, status: @payment.status } }
    assert_redirected_to payment_url(@payment)
  end

  test "should destroy payment" do
    assert_difference('Payment.count', -1) do
      delete payment_url(@payment)
    end

    assert_redirected_to payments_url
  end
end
