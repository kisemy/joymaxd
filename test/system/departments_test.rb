require "application_system_test_case"

class DepartmentsTest < ApplicationSystemTestCase
  setup do
    @department = departments(:one)
  end

  test "visiting the index" do
    visit departments_url
    assert_selector "h1", text: "Departments"
  end

  test "creating a Department" do
    visit departments_url
    click_on "New Department"

    fill_in "Current cec email", with: @department.current_CEC_email
    fill_in "Current cec name", with: @department.current_CEC_name
    fill_in "Current cec p no", with: @department.current_CEC_p_no
    fill_in "Current cec telephone", with: @department.current_CEC_telephone
    fill_in "Department code", with: @department.department_code
    fill_in "Department name", with: @department.department_name
    fill_in "General dept email", with: @department.general_dept_email
    click_on "Create Department"

    assert_text "Department was successfully created"
    click_on "Back"
  end

  test "updating a Department" do
    visit departments_url
    click_on "Edit", match: :first

    fill_in "Current cec email", with: @department.current_CEC_email
    fill_in "Current cec name", with: @department.current_CEC_name
    fill_in "Current cec p no", with: @department.current_CEC_p_no
    fill_in "Current cec telephone", with: @department.current_CEC_telephone
    fill_in "Department code", with: @department.department_code
    fill_in "Department name", with: @department.department_name
    fill_in "General dept email", with: @department.general_dept_email
    click_on "Update Department"

    assert_text "Department was successfully updated"
    click_on "Back"
  end

  test "destroying a Department" do
    visit departments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Department was successfully destroyed"
  end
end
