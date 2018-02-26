class Spaceship < ApplicationRecord
  belongs_to :user
  
  validates :location, :speed, :capacity, :captain, :price_per_day, :user_id, presence: true
  validates :speed, :capacity, :price_per_day, numericality: true
end
