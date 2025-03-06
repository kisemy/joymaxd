require "application_system_test_case"

class ChargeTypesTest < ApplicationSystemTestCase
  setup do
    @charge_type = charge_types(:one)
  end

  test "visiting the index" do
    visit charge_types_url
    assert_selector "h1", text: "Charge Types"
  end

  test "creating a Charge type" do
    visit charge_types_url
    click_on "New Charge Type"

    fill_in "Description", with: @charge_type.description
    click_on "Create Charge type"

    assert_text "Charge type was successfully created"
    click_on "Back"
  end

  test "updating a Charge type" do
    visit charge_types_url
    click_on "Edit", match: :first

    fill_in "Description", with: @charge_type.description
    click_on "Update Charge type"

    assert_text "Charge type was successfully updated"
    click_on "Back"
  end

  test "destroying a Charge type" do
    visit charge_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Charge type was successfully destroyed"
  end
end
