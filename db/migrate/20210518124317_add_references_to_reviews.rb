# frozen_string_literal: true

class AddReferencesToReviews < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :restaurant, index: true
  end
end
