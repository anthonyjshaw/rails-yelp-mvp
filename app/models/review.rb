# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :restaurant
  validates :rating, presence: true
  validates_numericality_of :rating, in: (0..5), only_integer: true, on: :create
  validates :content, presence: true
end

