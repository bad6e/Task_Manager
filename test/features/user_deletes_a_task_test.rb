require_relative "../test_helper"


class UserDeletesATasKTest < FeatureTest

  def test_user_can_delete_a_task
    visit "/"
    click_link "New Task"
    fill_in "task[title]", with: "Go home"
    fill_in "task[description]", with: "It's been a long day"
    click_button "Submit"
    click_button 'Delete'
    assert_equal '/tasks', current_path
  end
end


