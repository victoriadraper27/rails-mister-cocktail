# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

puts 'Cleaning database...'
Dose.destroy_all
Cocktail.destroy_all
Ingredient.destroy_all

puts 'Creating Ingredient...'
puts 'Creating Cocktail...'
puts 'Creating Dose...'

ingredients_array = []
cocktails_array = []

response = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list')
json = JSON.parse(response.read)

json['drinks'].each do |ingre|
  ingredients = {
    name: ingre['strIngredient1']
  }
  ingredient = Ingredient.create!(ingredients)
  ingredients_array << ingredient

  puts "Created #{ingredient.name}"
end

4.times do
  attributes = {
    name: Faker::Beer.name
  }
  cocktail = Cocktail.create!(attributes)
  cocktails_array << cocktail

  puts "Created #{cocktail.name}"
end

4.times do
  doses = {
    description: Faker::Food.measurement,
    ingredient: ingredients_array.sample,
    cocktail: cocktails_array.sample
  }
  dose = Dose.create!(doses)

  puts "Created #{dose.description}"
end

puts "Finished! Created #{Ingredient.count} ingredients"
puts "Finished! Created #{Cocktail.count} cocktails"
puts "Finished! Created #{Dose.count} doses"
