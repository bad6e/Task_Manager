require_relative '../test_helper'

class TaskTest < Minitest::Test

  def test_it_creates_a_task
    attributes = {:id=>1, :description=>"This task", :title=> "New task"}
    TaskManager.create(attributes)
    task = TaskManager.find(1)

    assert_equal 1, task.id
    assert_equal "This task", task.description
    assert_equal "New task", task.title

  end
end