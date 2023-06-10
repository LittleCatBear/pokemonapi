# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

require 'csv'

text = File.read(Rails.root.join('db', 'pokemon.csv'))
csv = CSV.parse(text, headers: true)
csv.each_with_index do |row, index|
  pokemon = Pokemon.find_or_initialize_by(name: row['Name'])

  pokemon.number = row['#']
  pokemon.hp = row['HP']
  pokemon.attack = row['Attack']
  pokemon.defense = row['Defense']
  pokemon.sp_atk = row['Sp. Atk']
  pokemon.sp_def = row['Sp. Def']
  pokemon.speed = row['Speed']
  pokemon.legendary = row['Legendary']

  type1 = Type.find_or_create_by(name: row['Type 1'])
  pokemon.type1 = type1

  if row['Type 2']
    type2 = Type.find_or_create_by(name: row['Type 2'])
    pokemon.type2 = type2
  end

  generation = Generation.find_or_create_by(number: row['Generation'])
  pokemon.generation = generation

  if pokemon.save
    puts "Successfully saved pokemon #{pokemon.name}, type1: #{pokemon.type1.name}, type2: #{pokemon.type2&.name}, generation: #{pokemon.generation.number}"
  else
    puts "Error: pokemon #{pokemon.name} at line #{index + 1} has errors #{pokemon.errors.full_messages}, skipping..."
    next
  end
end
