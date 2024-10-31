class CardOwnership < ApplicationRecord
  belongs_to :card
  belongs_to :card_owner
end
