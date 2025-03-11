# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "faker"

User.destroy_all
Dog.destroy_all

# Create users
puts "Creating user..."
users = [
  {
    email: 'ivy@example.com',
    password: 'password'
  },
  {
    email: 'amber@example.com',
    password: 'password'
  }
]

users.each do |user|
  User.create!(user)
end

# Create dogs
puts "Creating dog..."

10.times do
  Dog.create!(
    name: Faker::Creature::Dog.name,
    address: Faker::Locations::Australia.location,
    breed: Faker::Creature::Dog.breed,
    size: Faker::Creature::Dog.size,
    user: User.first
  )
end
