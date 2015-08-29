require_relative "../test_helper"

class UserCreatesATaskTest < FeatureTest
  def test_user_can_create_a_task
    visit "/"
    click_link "New Task"
    fill_in "task[title]", with: "Go home"
    fill_in "task[description]", with: "It's been a long day"
    assert_equal "/tasks/new", current_path
    click_button "Submit"
  end
end