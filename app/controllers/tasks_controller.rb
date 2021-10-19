class TasksController < ApplicationController
  before_action :find_task, only: [:change_status, :destroy]
  before_action :all_tasks, only: [:index, :create]
  def index
    @task = Task.new(user_id: @current_user.id)
  end

  def create
    @task = Task.new(handle_params)
    respond_to do |format|
      @errors = @task.errors unless @task.save
      format.js { render :layout => false }
    end
  end

  def change_status
    new_status = case @task.status
    when 'start'
      'process'
    when 'process'
      'done'
    else
      'start'
    end
    @task.update(status: Task.statuses[new_status])
    redirect_to tasks_path
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def handle_params
    params.require(:task).permit(:user_id, :description, :status, :import, :urgent)
  end

  def find_task
    @task = Task.find(params[:id])
  end

  def all_tasks
    @show_closed_task = params[:show_closed_task] == 'true'
    @tasks = if @show_closed_task
      Task.all
    else
      Task.except_done
    end.where(user_id: @current_user.id)
  end
end
