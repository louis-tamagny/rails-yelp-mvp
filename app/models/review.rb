class Review < ApplicationRecord
  belongs_to :restaurant
  validates :rating,
    comparison: { greater_than: -1, less_than: 6},
    numericality: { only_integer: true }

  validates :content, presence: true
end
