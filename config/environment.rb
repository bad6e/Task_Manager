require 'bundler'
Bundler.require

#This takes you to the current directory and then outside of it
APP_ROOT = File.expand_path("..", __dir__)

#This loads all the controllers
Dir.glob(File.join(APP_ROOT, 'app', 'controllers', '*.rb')).each { |file| require file}

#This loads all the models
Dir.glob(File.join(APP_ROOT, 'app', 'models', '*.rb')).each { |file| require file}

class TaskManagerApp < Sinatra::Base
  #Certain behaviors it should expect
  set :method_override, true
  #Start at the top of the tree and look down
  set :root, APP_ROOT
  #Set where we want the views to live
  set :views, File.join(APP_ROOT, 'app', 'views')
  #Set our public folder
  set :public_folder, File.join(APP_ROOT, 'app', 'public')
end

