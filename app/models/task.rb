class Task < ApplicationRecord
  belongs_to :schedule
  
  validates :task_title, presence: true, length: { maximum: 255 }
end
