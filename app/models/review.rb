# frozen_string_literal: true

class Review < ApplicationRecord
  RATING = (0..5).to_a

  belongs_to :restaurant
  validates :rating, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :content, presence: true
end
