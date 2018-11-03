class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  
  def show
    @task = Task.find(params[:id])
  end

  def new
    @schedule = Schedule.find(params[:schedule_id])
#    binding.pry
    @task = @schedule.tasks.build
  end

  def create
    @schedule = Schedule.find(params[:schedule_id])
    @task = @schedule.tasks.build(task_params)
    if @task.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to schedule_task_path(@schedule)
      flash.now[:danger] = 'タスクが作成されませんでした'
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private

  def task_params
    params.require(:task).permit(:task_title,:page_start,:page_end,:time_par_page)
  end
end
