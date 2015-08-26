require 'models/task_manager'
require 'models/task'

class TaskManagerApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__),'..')

  set :method_override, true

  get '/' do
    erb :dashboard
  end

  get '/tasks/:id/edit' do |id|
    @task = TaskManager.find(id.to_i)
    erb :edit
  end

  delete '/tasks/:id' do |id|
    TaskManager.delete(id.to_i)
    redirect '/tasks'
  end

  put "/tasks/:id" do |id|
    TaskManager.update(id.to_i, params[:task])
    redirect "/tasks/#{id}"
  end

  get '/tasks' do
    @tasks = TaskManager.all
    erb :index
  end

  get '/tasks/new' do
    erb :new
  end

  get '/tasks/:id' do |id|
    @task = TaskManager.find(id.to_i)
    erb :show
  end

  post '/tasks' do
    TaskManager.create(params[:task])
    redirect '/tasks'
  end
end