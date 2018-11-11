crumb :root do
  link "Home", root_path
end

#schedules
crumb :schedules do
  link "スケジュール一覧", schedules_path
end
crumb :new_schedule do
  link "新規スケジュール作成", new_schedule_path
end
crumb :schedule do |schedule|
  link "スケジュール詳細ページ @#{schedule.schedule_title}", schedule_path(schedule)
  parent :schedules
end
crumb :edit_schedule do |schedule|
  link "スケジュール編集ページ @#{schedule.schedule_title}", edit_schedule_path(schedule)
  parent :schedules
end

#sessions
crumb :login do
  link "ログイン", login_path
end

#tables
crumb :schedule_tables do |schedule|
  link "スケジュール表 @#{schedule.schedule_title}", schedule_tables_path(schedule)
  parent :schedules
end

#tasks
crumb :new_schedule_task do |schedule|
  link "教材新規登録ページ ", new_schedule_task_path(schedule)
  parent :schedule, schedule 
end

crumb :edit_schedule_task do |schedule ,task|
  link "教材編集ページ @#{task.task_title}", edit_schedule_task_path(schedule_id:schedule,id:task)
  parent :schedule, schedule 
end

#users
crumb :new_user do
  link "新規アカウント作成", new_user_path
end



# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).