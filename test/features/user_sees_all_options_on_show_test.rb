require_relative "../test_helper"

class UserSeesAllOptionsOnShowTest < FeatureTest

  def test_user_can_navigate_to_task_index_from_show_page
    visit "/"
    click_link "New Task"
    fill_in "task[title]", with: "Go home"
    fill_in "task[description]", with: "It's been a long day"
    assert_equal "/tasks/new", current_path
    click_button "Submit"

    click_link "Go home"
    within("#show-header") do
      assert page.has_content?("Task")
    end

    within("#show-footer") do
      assert page.has_content?("Return to Task Index")
    end
  end
end