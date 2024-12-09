class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy, :mark_as_completed]

  def index
    @tasks = params[:filter] == 'my_tasks' ? current_user.tasks : Task.all
    Task.all
  end

  def my_tasks
    @tasks = current_user.tasks
    render :index
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user

    if @task.save
      redirect_to @task, notice: 'Tarefa criada com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: "Tarefa atualizada com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end

    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  def mark_as_completed
    @task.update(status: true)
    redirect_to tasks_path, notice: 'Tarefa marcada como concluída'

  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :status)
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
