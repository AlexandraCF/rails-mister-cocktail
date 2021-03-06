# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
drinks_serialized = open(url).read
list_drinks = JSON.parse(drinks_serialized)

my_drinks = list_drinks['drinks']

puts "Cleaning database..."
Dose.destroy_all
Ingredient.destroy_all

ingredients = []

my_drinks.each do |drink|
  ingredients << drink["strIngredient1"]
end
10.times do 
  ingredients.each do |ingredient|
  Ingredient.create(name: ingredient)
  end
end
    #Ingredient.create(name: "ice")
    Cocktail.create(name: "Mojito", photo: "https://res.cloudinary.com/drobn3m9u/image/upload/v1613145030/vzhredqo2wzeacloqv55.jpg")
    Cocktail.create(name: "Bloody Mary")
    Cocktail.create(name: "Sex on the Beach")
    Cocktail.create(name: "Margarita")
    Cocktail.create(name: "Pina Colada")
    Cocktail.create(name: "Spritz")

puts "Finished!"
