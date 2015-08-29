require_relative '../test_helper'

class TaskTest < Minitest::Test

  def test_it_assigns_the_proper_attributes
    data = {:title => "Task Test 1", :description => "Task Test 2"}
    task = Task.new(data)
    assert_equal "Task Test 1", task.title
    assert_equal "Task Test 2", task.description
  end
end