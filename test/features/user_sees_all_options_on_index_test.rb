require_relative "../test_helper"

class UserSeesAllOptionsOnIndexTest < FeatureTest

  def test_user_sees_all_tasts_on_index_page
    visit "/tasks"
    within("#all_tasks") do
      assert page.has_content?("All Tasks")
    end
  end

  def test_user_can_navigate_to_task_manager_from_index_page
    visit "/tasks"
    click_link "Return to Bret's Task Manager"
    assert_equal "/", current_path
  end

  def test_user_can_navigate_to_new_robot_form_from_index_page
    visit "/tasks"
    click_link "Create a New Task"
    assert_equal "/tasks/new", current_path
  end
end