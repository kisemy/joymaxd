require 'test_helper'

class StockinHeadersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stockin_header = stockin_headers(:one)
  end

  test "should get index" do
    get stockin_headers_url
    assert_response :success
  end

  test "should get new" do
    get new_stockin_header_url
    assert_response :success
  end

  test "should create stockin_header" do
    assert_difference('StockinHeader.count') do
      post stockin_headers_url, params: { stockin_header: { PO_no: @stockin_header.PO_no, donor: @stockin_header.donor, donor_name: @stockin_header.donor_name, invoice_no: @stockin_header.invoice_no, project_code: @stockin_header.project_code, project_name: @stockin_header.project_name, received: @stockin_header.received, received_by: @stockin_header.received_by, received_date: @stockin_header.received_date, source_address: @stockin_header.source_address, source_code: @stockin_header.source_code, source_email: @stockin_header.source_email, source_name: @stockin_header.source_name, source_telephone: @stockin_header.source_telephone, source_type: @stockin_header.source_type, stk_no: @stockin_header.stk_no, supplier_address: @stockin_header.supplier_address, supplier_code: @stockin_header.supplier_code, supplier_email: @stockin_header.supplier_email, supplier_name: @stockin_header.supplier_name, telephone: @stockin_header.telephone, warehouse_location_code: @stockin_header.warehouse_location_code, warehouse_location_name: @stockin_header.warehouse_location_name } }
    end

    assert_redirected_to stockin_header_url(StockinHeader.last)
  end

  test "should show stockin_header" do
    get stockin_header_url(@stockin_header)
    assert_response :success
  end

  test "should get edit" do
    get edit_stockin_header_url(@stockin_header)
    assert_response :success
  end

  test "should update stockin_header" do
    patch stockin_header_url(@stockin_header), params: { stockin_header: { PO_no: @stockin_header.PO_no, donor: @stockin_header.donor, donor_name: @stockin_header.donor_name, invoice_no: @stockin_header.invoice_no, project_code: @stockin_header.project_code, project_name: @stockin_header.project_name, received: @stockin_header.received, received_by: @stockin_header.received_by, received_date: @stockin_header.received_date, source_address: @stockin_header.source_address, source_code: @stockin_header.source_code, source_email: @stockin_header.source_email, source_name: @stockin_header.source_name, source_telephone: @stockin_header.source_telephone, source_type: @stockin_header.source_type, stk_no: @stockin_header.stk_no, supplier_address: @stockin_header.supplier_address, supplier_code: @stockin_header.supplier_code, supplier_email: @stockin_header.supplier_email, supplier_name: @stockin_header.supplier_name, telephone: @stockin_header.telephone, warehouse_location_code: @stockin_header.warehouse_location_code, warehouse_location_name: @stockin_header.warehouse_location_name } }
    assert_redirected_to stockin_header_url(@stockin_header)
  end

  test "should destroy stockin_header" do
    assert_difference('StockinHeader.count', -1) do
      delete stockin_header_url(@stockin_header)
    end

    assert_redirected_to stockin_headers_url
  end
end
