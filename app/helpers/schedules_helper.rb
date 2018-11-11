module SchedulesHelper
  def fx_timeall(schedule,tasks)
   # 全体の勉強時間    
    timeall = 0    
    (schedule.day_start..schedule.day_end).each do |day|    
      week = day.wday    
      if week == 1    
        timeall += schedule.week.time_Mon    
      elsif week == 2    
        timeall += schedule.week.time_Tue    
      elsif week == 3    
        timeall += schedule.week.time_Wed    
      elsif week == 4    
        timeall += schedule.week.time_Thu      
      elsif week == 5    
        timeall += schedule.week.time_Fri      
      elsif week == 6    
        timeall += schedule.week.time_Sat      
      else    
        timeall += schedule.week.time_Sun      
      end    
    end    

   # 教科の勉強時間    
    timeall_tasks = 0    
    tasks.each do |task|    
      timeall_tasks += (task.page_end-task.page_start+1)*task.time_par_page
    end  
    timeall_tasks = (timeall_tasks/60.to_f).round
    return timeall, timeall_tasks
  end
end