# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

Restaurant.destroy_all

5.times do
  name = Faker::Restaurant.name
  category = Restaurant::CATEGORY.sample
  address = Faker::Address.street_address
  phone_number = Faker::PhoneNumber.phone_number

  new_restaurant = Restaurant.create!(
    name: name,
    category: category,
    address: address,
    phone_number: phone_number
  )

  rand(6).times do
    new_review = Review.new(content: Faker::Books::Dune.quote, rating: rand(6))
    new_review.restaurant = new_restaurant
    new_review.save!
  end

end
