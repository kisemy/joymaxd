require 'test_helper'

class SubSectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sub_section = sub_sections(:one)
  end

  test "should get index" do
    get sub_sections_url
    assert_response :success
  end

  test "should get new" do
    get new_sub_section_url
    assert_response :success
  end

  test "should create sub_section" do
    assert_difference('SubSection.count') do
      post sub_sections_url, params: { sub_section: { complete_projects: @sub_section.complete_projects, department_id: @sub_section.department_id, projects_in_progress: @sub_section.projects_in_progress, section_id: @sub_section.section_id, sub_section_code: @sub_section.sub_section_code, sub_section_name: @sub_section.sub_section_name } }
    end

    assert_redirected_to sub_section_url(SubSection.last)
  end

  test "should show sub_section" do
    get sub_section_url(@sub_section)
    assert_response :success
  end

  test "should get edit" do
    get edit_sub_section_url(@sub_section)
    assert_response :success
  end

  test "should update sub_section" do
    patch sub_section_url(@sub_section), params: { sub_section: { complete_projects: @sub_section.complete_projects, department_id: @sub_section.department_id, projects_in_progress: @sub_section.projects_in_progress, section_id: @sub_section.section_id, sub_section_code: @sub_section.sub_section_code, sub_section_name: @sub_section.sub_section_name } }
    assert_redirected_to sub_section_url(@sub_section)
  end

  test "should destroy sub_section" do
    assert_difference('SubSection.count', -1) do
      delete sub_section_url(@sub_section)
    end

    assert_redirected_to sub_sections_url
  end
end
