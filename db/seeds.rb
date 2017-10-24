# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# citynames ['San Diego', 'Los Angeles', 'Las Vegas', 'San Jose', 'San Francisco', 'Sacremento', 'Portland', 'Seattle']

# train = Train.create({ capacity: 20, source: 'San Diego', destination: 'Seattle', stops: ['Las Vegas', 'San Jose', 'Sacremento'] })
trains = Train.create([
  { capacity: 40, source: 'San Diego', destination: 'Portland', stops: ['Las Vegas', 'San Francisco', 'Sacremento'] },
  { capacity: 20, source: 'Los Angeles', destination: 'Seattle', stops: ['San Jose', 'Sacremento'] },
  { capacity: 30, source: 'Los Angeles', destination: 'San Francisco', stops: [] },
  { capacity: 20, source: 'San Francisco', destination: 'Seattle', stops: ['Sacremento', 'Portland'] },
  { capacity: 50, source: 'San Francisco', destination: 'San Diego', stops: ['Las Vegas'] }
])
