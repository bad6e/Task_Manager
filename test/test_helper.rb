ENV["RACK_ENV"] ||= "test"


#This sets up our test helper
require File.expand_path("../../config/environment", __FILE__)
require 'minitest/autorun'
require 'minitest/emoji'
require 'capybara'
require 'tilt/erb'

class Minitest::Test
  def teardown
    TaskManager.delete_all
  end
end

#Whenever we write a feature test we inherhit feature test class
Capybara.app = TaskManagerApp
Capybara.save_and_open_page_path = "/tmp"

class FeatureTest < Minitest::Test
  include Capybara::DSL
end