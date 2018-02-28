class Booking < ApplicationRecord
belongs_to :spaceship
belongs_to :user
validates :start_date, presence: true
validates :end_date, presence: true
validate :date_validation
# validates :spaceship, uniqueness: { scope: :user }

def date_validation
  if self[:end_date] < self[:start_date]
    errors[:end_date] << "Start date must be before end date"
    return false
  else
    return true
  end
end
end
