class CreateCardOwnerships < ActiveRecord::Migration[7.2]
  def change
    create_table :card_ownerships do |t|
      t.references :card, null: false, foreign_key: true
      t.references :card_owner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
