require 'yaml/store'
require_relative 'task'

class TaskManager
  def self.database
    @database ||= YAML::Store.new("db/task_manager")
  end

  def self.create(task)
    database.transaction do
      database['tasks'] ||= []
      database['total'] ||= 0
      database['total'] += 1
      database['tasks'] << { "id" => database['total'], "title" => task[:title], "description" => task[:description] }
    end
  end

  def self.raw_tasks
    database.transaction do
      database['tasks'] || []
    end
  end

  def self.all
    raw_tasks.map { |data| Task.new(data)  }
  end

  def self.raw_task(id)
    raw_tasks.find {|task| task["id"]== id}
  end

  def self.find(id)
    Task.new(raw_task(id))
  end

  def self.update(id, task)
    database.transaction do
      target = database['tasks'].find { |data| data["id"] == id}
      target["title"] = task[:title]
      target["description"] = task[:description]
    end
  end

  def self.delete(id)
    database.transaction do
      database['tasks'].delete_if {|task| task["id"] == id}
    end
  end
end
# We define a class method called create which will accept a task hash.

# Inside of this transaction, we try to find ['tasks'].
# If it doesn't exist, we make it an empty array ([]).
# We also want to keep track of a total number of tasks, so we either find that (database['total']) or assign it to 0.
# Next, we increase that total by 1 (database['total'] += 1) because we are creating a new task.
# Finally, we take our database['tasks']
# and shovel in a hash that includes an id key with a value of the total number of tasks,
# a title key with a value of task[:title], and a description key with a value of task[:description].