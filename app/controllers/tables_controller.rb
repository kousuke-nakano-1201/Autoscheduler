class TablesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user
  
  def index
    @schedule = Schedule.find(params[:schedule_id])
    @tasks = @schedule.tasks
  end
  
  def correct_user
    @schedule = current_user.schedules.find_by(id: params[:schedule_id])
    unless @schedule
      redirect_to root_url
    end
  end
end
