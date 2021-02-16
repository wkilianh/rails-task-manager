class TasksController < ApplicationController
  def index # the filename of the view has to be this, no matter what the URL is (here: /tasks)
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create # no view needed
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task[:id]) # argument replaces variable in the router (here: :id)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task) # short form of @task[:id]
  end

  def destroy
    Task.destroy(params[:id])
    redirect_to tasks_path
  end

end

private

def task_params
  params.require(:task).permit(:title, :details, :completed)
end

