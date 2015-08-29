require 'sequel'

class TaskManager
  def self.database
    if ENV["RACK_ENV"] == "test"
      @database ||= Sequel.sqlite("db/task_manager_test.sqlite3")
      # @database ||= YAML::Store.new("db/task_manager_test")
    else
      @database ||= Sequel.sqlite("db/task_manager.sqlite3")
      # @database ||= YAML::Store.new("db/task_manager")
    end
  end

  def self.create(task)
    @tasks = database.from(:tasks)
    id = @tasks.insert({:title => task[:title], :description => task[:description]})
    find(id)

    # # database.transaction do
    #   database['tasks'] ||= []
    #   database['total'] ||= 0
    #   database['total'] += 1
    #   database['tasks'] << { "id" => database['total'], "title" => task[:title], "description" => task[:description] }
    # end
  end

  def self.update(id, task)
    database.from(:tasks).where(:id => id).update(:title => task[:title], :description => task[:description])
    # database.transaction do
    #   target = database['tasks'].find { |data| data["id"] == id}
    #   target["title"] = task[:title]
    #   target["description"] = task[:description]
    # end
  end

  def self.create_table
    database.create_table :tasks do
      primary_key :id
      String :title
      String :description
    end
  end

  # def self.raw_tasks
  #   database.transaction do
  #     database['tasks'] || []
  #   end
  # end

  def self.all
    raw_tasks = database.from(:tasks).all
    raw_tasks.map { |data| Task.new(data)}
  end

  # def self.raw_task(id)
  #   raw_tasks.find {|task| task["id"]== id}
  # end

  def self.find(id)
    raw_task = database.from(:tasks).where(:id => id).first
    Task.new(raw_task)
    # Task.new(raw_task(id))
  end



  def self.delete(id)
    database.from(:tasks).where(:id => id).delete
    # database.transaction do
    #   database['tasks'].delete_if {|task| task["id"] == id}
    # end
  end

  def self.delete_all
    database.from(:tasks).delete

    # database.transaction do
    #   database["tasks"] = []
    #   database["total"] = 0
    # end
  end



  # def self.dataset
  #   database.from(:tasks)
  # end

  # private_class_method :dataset
end
