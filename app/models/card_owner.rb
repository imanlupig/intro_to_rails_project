class CardOwner < ApplicationRecord
  has_many :card_ownerships
  has_many :cards, through: :card_ownerships
  #many to many relation ship with cards
end
