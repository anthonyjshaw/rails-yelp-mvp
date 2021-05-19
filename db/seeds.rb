# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "cleaning restaurants"

Restaurant.destroy_all


puts "Seeding restaurants..."

10.times do
  name = Faker::Restaurant.name
  num = Faker::PhoneNumber.phone_number
  address = Faker::Address.street_address
  restaurant = Restaurant.new(name: name, phone_number: num, address: address, category: Restaurant::CATEGORIES.sample)
  restaurant.save if restaurant.valid?
  5.times do
    content = Faker::Restaurant.review
    rating = Faker::Number.between(from: 1, to: 5)
    review = Review.new(rating: rating, content: content)
    review.restaurant = restaurant
    review.save if review.valid?
  end
end
