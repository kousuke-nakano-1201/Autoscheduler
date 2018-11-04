class TablesController < ApplicationController
  def index
    @schedule = Schedule.find(params[:schedule_id])
    @tasks = @schedule.tasks
  end
end
