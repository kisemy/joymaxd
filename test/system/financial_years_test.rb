require "application_system_test_case"

class FinancialYearsTest < ApplicationSystemTestCase
  setup do
    @financial_year = financial_years(:one)
  end

  test "visiting the index" do
    visit financial_years_url
    assert_selector "h1", text: "Financial Years"
  end

  test "creating a Financial year" do
    visit financial_years_url
    click_on "New Financial Year"

    fill_in "Code", with: @financial_year.code
    fill_in "Description", with: @financial_year.description
    click_on "Create Financial year"

    assert_text "Financial year was successfully created"
    click_on "Back"
  end

  test "updating a Financial year" do
    visit financial_years_url
    click_on "Edit", match: :first

    fill_in "Code", with: @financial_year.code
    fill_in "Description", with: @financial_year.description
    click_on "Update Financial year"

    assert_text "Financial year was successfully updated"
    click_on "Back"
  end

  test "destroying a Financial year" do
    visit financial_years_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Financial year was successfully destroyed"
  end
end
