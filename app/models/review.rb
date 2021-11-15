class Review < ApplicationRecord
  belongs_to :booking

  validates :content, :rating, presence: true
  validates :rating, length: { in: 1..5 }
end
