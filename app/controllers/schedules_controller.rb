class SchedulesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @schedules = current_user.schedules.order('created_at DESC').page(params[:page])
  end

  def show
    @schedule = Schedule.find(params[:id])
#    binding.pry
    @tasks = @schedule.tasks.order('created_at DESC').page(params[:page])
  end

  def new
    @schedule = Schedule.new
    @schedule.build_week
  end

  def create
    @schedule = current_user.schedules.build(schedule_params)
    if @schedule.save
      flash[:success] = 'スケジュールを作成しました'
      redirect_to @schedule
    else
      flash.now[:danger] = 'スケジュールを作成できませんでした'
      render :new
    end
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      flash[:success] = 'スケジュールを更新しました'
      redirect_to @schedule
    else
      flash.now[:danger] = 'スケジュールを更新できませんでした'
      render :edit
    end
    
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:success] = 'スケジュールを削除しました'
    redirect_to schedules_url
  end
  
  private

  # Strong Parameter
  def schedule_params
    params.require(:schedule).permit(:schedule_title, :day_start, :day_end, week_attributes: [:id, :time_Mon, :time_Tue, :time_Wed, :time_Thu, :time_Fri, :time_Sat, :time_Sun])
  end
  
  def correct_user
    @schedule = current_user.schedules.find_by(id: params[:id])
    unless @schedule
      redirect_to root_url
    end
  end
  
end
