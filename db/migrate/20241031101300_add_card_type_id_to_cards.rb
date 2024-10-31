class AddCardTypeIdToCards < ActiveRecord::Migration[7.2]
  def change
    add_reference :cards, :card_type, null: false, foreign_key: true
  end
end
