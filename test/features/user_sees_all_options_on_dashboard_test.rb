require_relative "../test_helper"

class UserSeesAllOptionsOnDashBoardTest < FeatureTest

  def test_it_says_hello_to_brets_task_manager
    visit "/"
    assert page.has_content?("Bret's Task Manager")
  end

  def test_it_says_hello_to_brets_task_manager2
    visit "/"
    within("#greeting") do
      assert page.has_content?("Bret's Task Manager")
    end
  end

  def test_a_user_can_hit_the_task_index_button
    visit "/"
    click_button "Task Index"
    assert_equal "/tasks", current_path
  end

  def test_a_user_can_hit_the_new_task_button
    visit "/"
    click_button "New Task"
    assert_equal "/tasks/new", current_path
  end

  def test_a_user_can_hit_the_task_index_link
    visit "/"
    click_link "Task Index"
    assert_equal "/tasks", current_path
  end

  def test_a_user_can_hit_the_new_task_link
    visit "/"
    click_link "New Task"
    assert_equal "/tasks/new", current_path
  end
end

