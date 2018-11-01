class Schedule < ApplicationRecord
  belongs_to :user
  
  has_one :week, dependent: :destroy
  accepts_nested_attributes_for :week
  
  validates :schedule_title, presence: true, length: { maximum: 255 }
end
