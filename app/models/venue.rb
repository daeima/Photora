class Venue < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  belongs_to :user
  has_many_attached :photos

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :name, :location, :description, :price, presence: true
  validates :name, length: { minimum: 4 }
  validates :description, length: { minimum: 20 }

  def average_rating
    ratings = reviews.map do |review|
      review.rating
    end
    if reviews.present?
    average = ratings.sum / ratings.length
    else
    average = 0
    end
    return average
  end

  def self.top_three
    Venue.all.sort {|a,b| b.average_rating <=> a.average_rating}.first(3)
  end
end
