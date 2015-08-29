require_relative '../test_helper'

class TaskManagerTest < Minitest::Test

  def setup
    @attributes        = {:title=> "New task",   :description=>"This task"}
    @attributes_two    = {:title=> "New task 2", :description=>"This task 2"}
    @attributes_three  = {:title=> "New task 3", :description=>"This task 3"}
    @task_1 = TaskManager.create(@attributes)
    @task_2 = TaskManager.create(@attributes_two)
    @task_3 = TaskManager.create(@attributes_three)
  end

  def test_it_creates_a_task
    task = TaskManager.find(@task_1.id)
    assert_equal "New task", task.title
    assert_equal "This task", task.description
  end

  def test_it_displays_all_tasks
    task =  TaskManager.all
    assert_equal 3, task.count
  end

  def test_it_finds_task_by_id
    task = TaskManager.find(@task_3.id)
    assert_equal "New task 3", task.title
  end

  def test_it_can_update_a_task
    task = TaskManager.update(@task_1.id, @attributes_two)
    updated_task = TaskManager.find(@task_1.id)
    assert_equal "New task 2", updated_task.title
  end

  def test_it_can_delete_a_task
    task = @task_1
    TaskManager.delete(task.id)
    assert_equal 2, TaskManager.all.count
  end

  def test_it_can_delete_all_tasks
    TaskManager.delete_all
    assert_equal 0, TaskManager.all.count
  end
end