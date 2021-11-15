class Venue < ApplicationRecord
  has_many :bookings
  belongs_to :user

  validates :name, :location, :description, :price, presence: true
  validates :name, length: { minimum: 4 }, uniqueness: true
  validates :description, length: { in: 50..200 }
end
