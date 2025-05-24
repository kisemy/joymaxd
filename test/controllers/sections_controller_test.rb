require 'test_helper'

class SectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @section = sections(:one)
  end

  test "should get index" do
    get sections_url
    assert_response :success
  end

  test "should get new" do
    get new_section_url
    assert_response :success
  end

  test "should create section" do
    assert_difference('Section.count') do
      post sections_url, params: { section: { complete_projects: @section.complete_projects, current_co_email: @section.current_co_email, current_co_name: @section.current_co_name, current_co_telephone: @section.current_co_telephone, department_code: @section.department_code, department_name: @section.department_name, general_section_email: @section.general_section_email, projects_in_progress: @section.projects_in_progress, section_code: @section.section_code, section_name: @section.section_name } }
    end

    assert_redirected_to section_url(Section.last)
  end

  test "should show section" do
    get section_url(@section)
    assert_response :success
  end

  test "should get edit" do
    get edit_section_url(@section)
    assert_response :success
  end

  test "should update section" do
    patch section_url(@section), params: { section: { complete_projects: @section.complete_projects, current_co_email: @section.current_co_email, current_co_name: @section.current_co_name, current_co_telephone: @section.current_co_telephone, department_code: @section.department_code, department_name: @section.department_name, general_section_email: @section.general_section_email, projects_in_progress: @section.projects_in_progress, section_code: @section.section_code, section_name: @section.section_name } }
    assert_redirected_to section_url(@section)
  end

  test "should destroy section" do
    assert_difference('Section.count', -1) do
      delete section_url(@section)
    end

    assert_redirected_to sections_url
  end
end
