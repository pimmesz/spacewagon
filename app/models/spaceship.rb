class Spaceship < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, :location, :speed, :capacity, :captain, :price_per_day, :user_id, presence: true
  validates :speed, :capacity, :price_per_day, numericality: true
  validates :name, uniqueness: true
end
