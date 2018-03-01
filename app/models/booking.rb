class Booking < ApplicationRecord
belongs_to :spaceship
belongs_to :user
validates :start_date, presence: true
validates :end_date, presence: true
validate :date_validation
validate :date_validation_past
# validates :spaceship, uniqueness: { scope: :user }

def date_validation
  if self[:end_date] < self[:start_date]
    errors[:end_date] << "can't be before the start date"
    return false
  else
    return true
  end
end

def date_validation_past
  if self[:start_date] >= DateTime.now.to_date
    true
  else
    errors[:start_date] << "can't be in the past"
    return false
  end
end
end
