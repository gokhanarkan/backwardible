# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
require 'json'

csv_text = File.read('./db/data.csv')
csv = CSV.parse(csv_text, headers: true)
csv.each do |row|
  genre = JSON.parse(row['genre'])
  publisher = JSON.parse(row['publisher'])
  also_available = JSON.parse(row['alsoAvailable'])
  Game.create(title: row['title'], release_date: row['releaseDate'],
              description: row['description'], genre: genre,
              image: row['image'], score: row['score'], developer: row['developer'],
              publisher: publisher, rating: row['rating'], also_available: also_available)
end
