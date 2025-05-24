require "application_system_test_case"

class ProjectTasksTest < ApplicationSystemTestCase
  setup do
    @project_task = project_tasks(:one)
  end

  test "visiting the index" do
    visit project_tasks_url
    assert_selector "h1", text: "Project Tasks"
  end

  test "creating a Project task" do
    visit project_tasks_url
    click_on "New Project Task"

    fill_in "Actual end date", with: @project_task.actual_end_date
    fill_in "Actual start date", with: @project_task.actual_start_date
    fill_in "Actual task duration", with: @project_task.actual_task_duration
    fill_in "Auto no", with: @project_task.auto_no
    fill_in "P tsk 01", with: @project_task.p_tsk_01
    check "Parallel" if @project_task.parallel
    fill_in "Percentage coverage", with: @project_task.percentage_coverage
    fill_in "Percentage coverage planned", with: @project_task.percentage_coverage_planned
    fill_in "Planned end date", with: @project_task.planned_end_date
    fill_in "Planned start date", with: @project_task.planned_start_date
    fill_in "Planned task duration", with: @project_task.planned_task_duration
    fill_in "Project code", with: @project_task.project_code
    fill_in "Task description", with: @project_task.task_description
    fill_in "Task no", with: @project_task.task_no
    click_on "Create Project task"

    assert_text "Project task was successfully created"
    click_on "Back"
  end

  test "updating a Project task" do
    visit project_tasks_url
    click_on "Edit", match: :first

    fill_in "Actual end date", with: @project_task.actual_end_date
    fill_in "Actual start date", with: @project_task.actual_start_date
    fill_in "Actual task duration", with: @project_task.actual_task_duration
    fill_in "Auto no", with: @project_task.auto_no
    fill_in "P tsk 01", with: @project_task.p_tsk_01
    check "Parallel" if @project_task.parallel
    fill_in "Percentage coverage", with: @project_task.percentage_coverage
    fill_in "Percentage coverage planned", with: @project_task.percentage_coverage_planned
    fill_in "Planned end date", with: @project_task.planned_end_date
    fill_in "Planned start date", with: @project_task.planned_start_date
    fill_in "Planned task duration", with: @project_task.planned_task_duration
    fill_in "Project code", with: @project_task.project_code
    fill_in "Task description", with: @project_task.task_description
    fill_in "Task no", with: @project_task.task_no
    click_on "Update Project task"

    assert_text "Project task was successfully updated"
    click_on "Back"
  end

  test "destroying a Project task" do
    visit project_tasks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project task was successfully destroyed"
  end
end
