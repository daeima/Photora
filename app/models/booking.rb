class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :venue
  has_one :review

  validates :start_time, :end_time, presence: true
end
