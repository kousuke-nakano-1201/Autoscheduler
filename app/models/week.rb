class Week < ApplicationRecord
  belongs_to :schedule,optional: true
end
