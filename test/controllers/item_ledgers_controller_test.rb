require 'test_helper'

class ItemLedgersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_ledger = item_ledgers(:one)
  end

  test "should get index" do
    get item_ledgers_url
    assert_response :success
  end

  test "should get new" do
    get new_item_ledger_url
    assert_response :success
  end

  test "should create item_ledger" do
    assert_difference('ItemLedger.count') do
      post item_ledgers_url, params: { item_ledger: { description: @item_ledger.description, document_no: @item_ledger.document_no, item_no: @item_ledger.item_no, posting_date: @item_ledger.posting_date, quantity: @item_ledger.quantity, source_no: @item_ledger.source_no } }
    end

    assert_redirected_to item_ledger_url(ItemLedger.last)
  end

  test "should show item_ledger" do
    get item_ledger_url(@item_ledger)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_ledger_url(@item_ledger)
    assert_response :success
  end

  test "should update item_ledger" do
    patch item_ledger_url(@item_ledger), params: { item_ledger: { description: @item_ledger.description, document_no: @item_ledger.document_no, item_no: @item_ledger.item_no, posting_date: @item_ledger.posting_date, quantity: @item_ledger.quantity, source_no: @item_ledger.source_no } }
    assert_redirected_to item_ledger_url(@item_ledger)
  end

  test "should destroy item_ledger" do
    assert_difference('ItemLedger.count', -1) do
      delete item_ledger_url(@item_ledger)
    end

    assert_redirected_to item_ledgers_url
  end
end
