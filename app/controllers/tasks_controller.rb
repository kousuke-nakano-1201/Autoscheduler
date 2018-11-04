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
      flash[:success] = '教材を登録しました。'
      redirect_to schedule_path(@schedule)
    else
      flash.now[:danger] = '教材を登録できませんでした'
      render :new
    end
  end

  def edit
    @schedule = Schedule.find(params[:schedule_id])
    @task = Task.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:schedule_id])
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success] = '教材を更新しました。'
      redirect_to schedule_path(@schedule)
    else
      flash.now[:danger] = '教材を更新できませんでした'
      render :edit
    end
  end

  def destroy
    @schedule = Schedule.find(params[:schedule_id])
    @task = Task.find(params[:id])
    @task.destroy
    flash[:success] = '教材を削除しました'
    redirect_to schedule_path(@schedule)
  end
  
  private

  def task_params
    params.require(:task).permit(:task_title,:page_start,:page_end,:time_par_page)
  end
   
  def correct_user
    @task = Task.find(params[:id])
    @schedule = current_user.schedules.find_by(id: @task.schedule_id)
    unless @schedule
      redirect_to root_url
    end
  end
end
