class Schedule < ApplicationRecord
  belongs_to :user
  
  has_one :week, dependent: :destroy
  accepts_nested_attributes_for :week
  
  has_many :tasks, dependent: :destroy
  
  validates :schedule_title, presence: true, length: { maximum: 255 }
  
  validate :not_before_today

  def not_before_today
    errors.add(:day_end, 'は開始日以降にしてください．') if day_end.nil? || day_end < day_start
  end
end
