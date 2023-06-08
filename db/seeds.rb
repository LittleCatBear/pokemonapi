# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'csv'

text = File.read(Rails.root.join('db', 'pokemon.csv'))
pokemons = CSV.parse(text, headers: true, encoding: 'ISO-8859-1')
pokemons.each do |pokemon|
  puts pokemon.to_hash
end