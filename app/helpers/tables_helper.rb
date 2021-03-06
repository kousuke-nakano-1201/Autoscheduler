module TablesHelper
  def calculation(schedule,tasks)
  # 重要な変数
    count_days = (schedule.day_end - schedule.day_start).to_i + 1
    days_time = Array.new(count_days)
    count_tasks = tasks.count
    tasks_time = Array.new(count_tasks)
    timeall = 0  
    tables_time = Array.new(count_days).map{Array.new(count_tasks)}  
    tables_page = Array.new(count_days).map{Array.new(count_tasks)}  

 # 全体の勉強時間  
    (schedule.day_start..schedule.day_end).each_with_index do |day, index|  
      week = day.wday  
      if week == 1  
        days_time[index] = schedule.week.time_Mon  
      elsif week == 2  
        days_time[index] = schedule.week.time_Tue  
      elsif week == 3  
        days_time[index] = schedule.week.time_Wed  
      elsif week == 4  
        days_time[index] = schedule.week.time_Thu    
      elsif week == 5  
        days_time[index] = schedule.week.time_Fri    
      elsif week == 6  
        days_time[index] = schedule.week.time_Sat    
      else  
        days_time[index] = schedule.week.time_Sun    
      end  
      timeall += days_time[index]  
    end  
    day_time_record = Marshal.load(Marshal.dump(days_time))  

    # 教科の勉強配分  
    timeall_tasks = 0  
    tasks.each do |task|  
      timeall_tasks += (task.page_end-task.page_start+1)*task.time_par_page  
    end  

    tasks_timeadd = 0  
    tasks.each_with_index do |task, index|  
      tasks_timeadd += timeall*(task.page_end - task.page_start + 1)*task.time_par_page / timeall_tasks.to_f  
      tasks_time[index] = tasks_timeadd.round   
    end  

    (1..count_tasks).each do |n|  
      index = count_tasks-n  
      if index != 0  
        tasks_time[index] = tasks_time[index] - tasks_time[index-1] 
      end  
    end  

    # 各日の教科の勉強配分  
    (0..count_tasks-1).each do |index_task|  
      days_timeadd = 0  
      (0..count_days-1).each do |index_day|  
        days_timeadd += tasks_time[index_task] * days_time[index_day]/ timeall.to_f  
        tables_time[index_day][index_task] = days_timeadd.round  
      end  
  
    (1..count_days).each do |n|  
      index_day = count_days-n  
      if index_day != 0  
        tables_time[index_day][index_task] = tables_time[index_day][index_task] - tables_time[index_day-1][index_task]  
      end  
      days_time[index_day] -= tables_time[index_day][index_task]  
        timeall -= tables_time[index_day][index_task]  
      end  
    end  

    # 各日の教科のページ配分  
    tasks.each_with_index do |task, index_task|  
      pageall = task.page_end - task.page_start + 1  
      days_pageadd = 0  
      (0..count_days-1).each do |index_day|  
        days_pageadd += pageall * tables_time[index_day][index_task] / tasks_time[index_task].to_f  
        tables_page[index_day][index_task] = days_pageadd.round  
      end  
  
      (1..count_days).each do |n|  
        index_day = count_days-n  
        if index_day != 0  
          tables_page[index_day][index_task] = tables_page[index_day][index_task] - tables_page[index_day-1][index_task]  
        end  
      end  
    end 
    return tables_page, day_time_record
  end
end