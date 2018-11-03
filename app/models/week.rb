class Week < ApplicationRecord
  belongs_to :schedule,optional: true
  validates :time_Mon, numericality: {
            only_integer: true, greater_than_or_equal_to: 0
          }
  validates :time_Tue, numericality: {
            only_integer: true, greater_than_or_equal_to: 0
          }
  validates :time_Wed, numericality: {
            only_integer: true, greater_than_or_equal_to: 0
          }
  validates :time_Thu, numericality: {
            only_integer: true, greater_than_or_equal_to: 0
          }
  validates :time_Fri, numericality: {
            only_integer: true, greater_than_or_equal_to: 0
          }  
  validates :time_Sat, numericality: {
            only_integer: true, greater_than_or_equal_to: 0
          }
  validates :time_Sun, numericality: {
            only_integer: true, greater_than_or_equal_to: 0
          }
end
