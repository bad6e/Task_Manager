ENV["RACK_ENV"] ||= "test"


#This sets up our test helper
require File.expand_path("../../config/environment", __FILE__)
require 'minitest/autorun'
require 'minitest/emoji'

class Minitest::Test

  def teardown
    TaskManager.delete_all
  end
end
