class TasksController < ApplicationController
  # As a user, I can list tasks
  def index
    @tasks = Task.all
  end
  # As a user, I can view the details of a task

  def show
    @tasks = Task.find(params[:id])
  end
  # As a user, I can add a new task

  def new
    @tasks = Task.new
  end

  def create
    @tasks = Task.new(task_params)
    @tasks.save

    redirect_to tasks_path(@tasks)
  end
  # As a user, I can edit a task (mark as completed / update title & details)

  def edit
    @tasks = Task.find(params[:id])
  end

  def update
    @tasks = Task.find(params[:id])
    @tasks.update(task_params)

    redirect_to tasks_path(@tasks)
  end

  # As a user, I can remove a task
  def destroy
    @tasks = Task.find(params[:id])
    @tasks.destroy
  end
end

private

def task_params
  params.require(:task).permit(:title, :details)
end
