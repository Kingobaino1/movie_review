# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create a main sample user.
User.create!(full_name: 'Example User', user_name: 'euser',
             email: 'user@example.com',
             password: 'foobar',
             password_confirmation: 'foobar')


# Generate a bunch of additional users.
5.times do |n|
  full_name = Faker::Name.name
  user_name = "user-#{n+1}"
  email = "u-#{n+1}@example.com"
  password = 'password'
  User.create!(full_name: full_name, user_name: user_name, email: email, 
               password: password,
               password_confirmation: password)
end