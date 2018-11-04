class Task < ApplicationRecord
  belongs_to :schedule
  
  validates :task_title, presence: true, length: { maximum: 255 }
  
  validates :page_start, numericality: {
            only_integer: true, greater_than_or_equal_to: 0
          }
  validates :page_end, numericality: {
            only_integer: true, greater_than_or_equal_to: 0
          }
  validates :time_par_page, numericality: {
            only_integer: true, greater_than_or_equal_to: 0
          }
end
