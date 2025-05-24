require "application_system_test_case"

class WardsTest < ApplicationSystemTestCase
  setup do
    @ward = wards(:one)
  end

  test "visiting the index" do
    visit wards_url
    assert_selector "h1", text: "Wards"
  end

  test "creating a Ward" do
    visit wards_url
    click_on "New Ward"

    fill_in "Sub county code", with: @ward.sub_county_code
    fill_in "Sub county name", with: @ward.sub_county_name
    fill_in "Ward admin email", with: @ward.ward_admin_email
    fill_in "Ward admin name", with: @ward.ward_admin_name
    fill_in "Ward admin pno", with: @ward.ward_admin_pno
    fill_in "Ward admin telephone", with: @ward.ward_admin_telephone
    fill_in "Ward code", with: @ward.ward_code
    fill_in "Ward name", with: @ward.ward_name
    click_on "Create Ward"

    assert_text "Ward was successfully created"
    click_on "Back"
  end

  test "updating a Ward" do
    visit wards_url
    click_on "Edit", match: :first

    fill_in "Sub county code", with: @ward.sub_county_code
    fill_in "Sub county name", with: @ward.sub_county_name
    fill_in "Ward admin email", with: @ward.ward_admin_email
    fill_in "Ward admin name", with: @ward.ward_admin_name
    fill_in "Ward admin pno", with: @ward.ward_admin_pno
    fill_in "Ward admin telephone", with: @ward.ward_admin_telephone
    fill_in "Ward code", with: @ward.ward_code
    fill_in "Ward name", with: @ward.ward_name
    click_on "Update Ward"

    assert_text "Ward was successfully updated"
    click_on "Back"
  end

  test "destroying a Ward" do
    visit wards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ward was successfully destroyed"
  end
end
