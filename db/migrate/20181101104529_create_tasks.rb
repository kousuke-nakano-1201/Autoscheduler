class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.references :schedule, foreign_key: true
      t.string :task_title
      t.integer :page_start
      t.integer :page_end
      t.integer :time_par_page

      t.timestamps
    end
  end
end
