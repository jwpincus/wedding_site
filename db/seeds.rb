# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(
  name: 'Jack Pincus',
  email: 'jwpincus@gmail.com',
  password: 'password',
  password_confirmation: 'password',
)

guest = Guest.create(
  first_name: 'Jack',
  last_name: 'Pincus',
  email: 'jwpincus@gmail.com'
)

guest.plus_ones.create(
  first_name: 'Cayley',
  last_name: 'Coulbourn',
  email: 'cayley_coulbourn@gmail.com'
)
