class Category < ApplicationRecord
  #one to many relationship with Card
  has_many :cards

  validates :name, presence: true, uniqueness: true
end
