require "application_system_test_case"

class BankgroupsTest < ApplicationSystemTestCase
  setup do
    @bankgroup = bankgroups(:one)
  end

  test "visiting the index" do
    visit bankgroups_url
    assert_selector "h1", text: "Bankgroups"
  end

  test "creating a Bankgroup" do
    visit bankgroups_url
    click_on "New Bankgroup"

    fill_in "Code", with: @bankgroup.code
    fill_in "Description", with: @bankgroup.description
    fill_in "Gl account", with: @bankgroup.gl_account
    click_on "Create Bankgroup"

    assert_text "Bankgroup was successfully created"
    click_on "Back"
  end

  test "updating a Bankgroup" do
    visit bankgroups_url
    click_on "Edit", match: :first

    fill_in "Code", with: @bankgroup.code
    fill_in "Description", with: @bankgroup.description
    fill_in "Gl account", with: @bankgroup.gl_account
    click_on "Update Bankgroup"

    assert_text "Bankgroup was successfully updated"
    click_on "Back"
  end

  test "destroying a Bankgroup" do
    visit bankgroups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bankgroup was successfully destroyed"
  end
end
