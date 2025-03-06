require "application_system_test_case"

class AcchartsTest < ApplicationSystemTestCase
  setup do
    @acchart = accharts(:one)
  end

  test "visiting the index" do
    visit accharts_url
    assert_selector "h1", text: "Accharts"
  end

  test "creating a Acchart" do
    visit accharts_url
    click_on "New Acchart"

    fill_in "Acc name", with: @acchart.acc_name
    fill_in "Accclass", with: @acchart.accclass
    fill_in "Acctype", with: @acchart.acctype
    fill_in "Balance", with: @acchart.balance
    fill_in "Category", with: @acchart.category
    click_on "Create Acchart"

    assert_text "Acchart was successfully created"
    click_on "Back"
  end

  test "updating a Acchart" do
    visit accharts_url
    click_on "Edit", match: :first

    fill_in "Acc name", with: @acchart.acc_name
    fill_in "Accclass", with: @acchart.accclass
    fill_in "Acctype", with: @acchart.acctype
    fill_in "Balance", with: @acchart.balance
    fill_in "Category", with: @acchart.category
    click_on "Update Acchart"

    assert_text "Acchart was successfully updated"
    click_on "Back"
  end

  test "destroying a Acchart" do
    visit accharts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Acchart was successfully destroyed"
  end
end
