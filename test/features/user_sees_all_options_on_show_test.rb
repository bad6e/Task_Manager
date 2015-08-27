require_relative "../test_helper"

class UserSeesAllOptionsOnShowTest < FeatureTest

  def test_user_can_navigate_to_task_index_from_show_page
    visit "/"
    click_link "New Task"
    fill_in "task[title]", with: "Go home"
    fill_in "task[description]", with: "It's been a long day"
    click_button "Submit"
    assert_equal "/tasks", current_path

    visit "/tasks/1"
    click_link "Return to Task Index"
    assert_equal "/tasks", current_path
  end
end