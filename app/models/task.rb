class Task
  attr_reader :title,
              :description,
              :id

  def initialize(data)
    @id = data["id"]
    @title = data["title"]
    @description = data["description"]
  end
end

# Here we are defining the class Task and then creating attr_readers
# for title, description, and id.
# Upon initialization, it will accept a data hash and
# access each piece of data via the keys (data["id"], data["title"], data["description"]).