# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'httparty'
require 'faker'

#fetch data from YuGiOh API
API_URL = 'https://db.ygoprodeck.com/api/v7/cardinfo.php'
response = HTTParty.get(API_URL)
cards_data = JSON.parse(response.body)["data"]

cards_data.each do |card_data|
  #find or create CardType
  card_type = CardType.find_or_create_by(name: card_data["type"])

  #Create card with associated CardType
  card = Card.create(
    name: card_data["name"],
    desc: card_data["desc"],
    atk: card_data["atk"],
    def: card_data["def"],
    card_type: card_type
  )
  puts "Creating Card: #{card.name}"
  if card.persisted?
    puts "Created: #{card.name}"
  else
    puts "Failed to make card: #{card.errors.full_messages.join(", ")}"
  end
end

15.times do
  owner = CardOwner.create(name: Faker::Name.name,)

  owner.cards << Card.order("RANDOM()").limit(10)
end