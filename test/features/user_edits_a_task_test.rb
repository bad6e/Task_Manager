require_relative "../test_helper"

class UserEditsATasKTest < FeatureTest

  def test_user_can_return_to_root_page
    visit "/tasks"
    click_link "Return to Bret's Task Manager"
    assert_equal "/", current_path
  end

  def test_user_can_edit_a_task
    visit "/"
    click_link "New Task"
    fill_in "task[title]", with: "Go home"
    fill_in "task[description]", with: "It's been a long day"
    click_button "Submit"
    click_link "Edit"
    fill_in "task[title]", with: "Go home"
    fill_in "task[description]", with: "It's been a long day"
    click_button "Submit"
    assert_equal "/tasks/1", current_path
  end
end