require "application_system_test_case"

class ChargetypesTest < ApplicationSystemTestCase
  setup do
    @chargetype = chargetypes(:one)
  end

  test "visiting the index" do
    visit chargetypes_url
    assert_selector "h1", text: "Chargetypes"
  end

  test "creating a Chargetype" do
    visit chargetypes_url
    click_on "New Chargetype"

    fill_in "Charge description", with: @chargetype.charge_description
    fill_in "Code", with: @chargetype.code
    click_on "Create Chargetype"

    assert_text "Chargetype was successfully created"
    click_on "Back"
  end

  test "updating a Chargetype" do
    visit chargetypes_url
    click_on "Edit", match: :first

    fill_in "Charge description", with: @chargetype.charge_description
    fill_in "Code", with: @chargetype.code
    click_on "Update Chargetype"

    assert_text "Chargetype was successfully updated"
    click_on "Back"
  end

  test "destroying a Chargetype" do
    visit chargetypes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Chargetype was successfully destroyed"
  end
end
