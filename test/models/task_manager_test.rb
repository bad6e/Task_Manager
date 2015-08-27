require_relative '../test_helper'

class TaskManagerTest < Minitest::Test

  def setup
    attributes        = {:id=>1, :description=>"This task", :title=> "New task"}
    attributes_two    = {:id=>2, :description=>"This task 2", :title=> "New task 2"}
    attributes_three  = {:id=>3, :description=>"This task 3", :title=> "New task 3"}
    TaskManager.create(attributes)
    TaskManager.create(attributes_two)
    TaskManager.create(attributes_three)
  end

  def test_it_creates_a_task
    task = TaskManager.find(1)
    assert_equal 1, task.id
    assert_equal "This task", task.description
    assert_equal "New task", task.title
  end

  def test_it_displays_all_tasks
    task =  TaskManager.all
    assert_equal 3, task.count
  end

  def test_it_finds_task_by_id
    task = TaskManager.find(2)
    assert_equal "New task 2", task.title
  end

  def test_it_can_update_a_task
    task = TaskManager.update(2, {:id=>2, :description=>"This task 2", :title=> "New task 3"})
    task_1 = TaskManager.find(2)
    assert_equal "New task 3", task_1.title
  end

  def test_it_can_delete_a_task
    task = TaskManager.delete(3)
    assert_equal 2, task.count
  end

  def test_it_can_delete_all_tasks
    assert_equal 3, TaskManager.all.count
    task = TaskManager.delete_all
    assert_equal 0, TaskManager.all.count
  end
end