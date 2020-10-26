# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
require 'json'

csv_text = File.read('./db/clean_data.csv')
csv = CSV.parse(csv_text)
csv.each do |row|
  genre = JSON.parse(row[4])
  publisher = JSON.parse(row[8])
  also_available = JSON.parse(row[10])
  Game.create(title: row[1], release_date: row[2],
              description: row[3], genre: genre,
              image: row[5], score: row[6].to_i, developer: row[7],
              publisher: publisher, rating: row[9], also_available: also_available)
end
