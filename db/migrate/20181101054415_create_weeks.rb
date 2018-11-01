class CreateWeeks < ActiveRecord::Migration[5.0]
  def change
    create_table :weeks do |t|
      t.references :schedule, foreign_key: true
      t.integer :time_Mon
      t.integer :time_Tue
      t.integer :time_Wed
      t.integer :time_Thu
      t.integer :time_Fri
      t.integer :time_Sat
      t.integer :time_Sun

      t.timestamps
    end
  end
end
