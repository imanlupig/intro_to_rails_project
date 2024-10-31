class Card < ApplicationRecord
  belongs_to :category
  has_many :card_ownerships
  has_many :card_owners, through: :card_ownerships

  validates :name, presence: true, uniqueness: true
  validates :desc, presence: true
end
