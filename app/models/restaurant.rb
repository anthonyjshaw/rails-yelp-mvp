# frozen_string_literal: true

class Restaurant < ApplicationRecord
  CATEGORIES = %w[chinese italian japanese french belgian american english].sort.freeze
  has_many :reviews, dependent: :destroy
  validates_associated :reviews
  validates_presence_of :name, :address, :category, :phone_number
  validates_uniqueness_of :address, :phone_number

  validates :category, inclusion: { in: CATEGORIES }
end
