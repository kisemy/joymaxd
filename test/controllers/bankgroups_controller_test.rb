require 'test_helper'

class BankgroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bankgroup = bankgroups(:one)
  end

  test "should get index" do
    get bankgroups_url
    assert_response :success
  end

  test "should get new" do
    get new_bankgroup_url
    assert_response :success
  end

  test "should create bankgroup" do
    assert_difference('Bankgroup.count') do
      post bankgroups_url, params: { bankgroup: { code: @bankgroup.code, description: @bankgroup.description, gl_account: @bankgroup.gl_account } }
    end

    assert_redirected_to bankgroup_url(Bankgroup.last)
  end

  test "should show bankgroup" do
    get bankgroup_url(@bankgroup)
    assert_response :success
  end

  test "should get edit" do
    get edit_bankgroup_url(@bankgroup)
    assert_response :success
  end

  test "should update bankgroup" do
    patch bankgroup_url(@bankgroup), params: { bankgroup: { code: @bankgroup.code, description: @bankgroup.description, gl_account: @bankgroup.gl_account } }
    assert_redirected_to bankgroup_url(@bankgroup)
  end

  test "should destroy bankgroup" do
    assert_difference('Bankgroup.count', -1) do
      delete bankgroup_url(@bankgroup)
    end

    assert_redirected_to bankgroups_url
  end
end
