class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :bookings
  has_many :spaceships
  has_many :my_spaceships_bookings, through: :spaceships, source: :bookings

  mount_uploader :photo, PhotoUploader

end
