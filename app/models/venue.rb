class Venue < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user
  has_many_attached :photos

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :name, :location, :description, :price, presence: true
  validates :name, length: { minimum: 4 }, uniqueness: true
  validates :description, length: { in: 20..200 }
end
