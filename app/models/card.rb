class Card < ApplicationRecord
  belongs_to :category
  has_many :card_ownerships
  has_many :card_owners, through: :card_ownerships
end
