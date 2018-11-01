class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.references :user, foreign_key: true
      t.string :schedule_title
      t.date :day_start
      t.date :day_end

      t.timestamps
    end
  end
end
