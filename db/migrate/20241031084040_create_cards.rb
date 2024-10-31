class CreateCards < ActiveRecord::Migration[7.2]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :card_type
      t.text :desc
      t.integer :atk
      t.integer :def
      t.integer :level
      t.references :card_type, foreign_key: { to_table: :card_types }

      t.timestamps
    end
  end
end
