class Booking < ApplicationRecord
belongs_to :spaceship
belongs_to :user
validates :start_date, prescence: :true
validates :end_date, prescence: :true
validates :spaceship, uniqueness: { scope: :user }
end
