class CreateCards < ActiveRecord::Migration[7.2]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :type
      t.text :desc
      t.integer :atk
      t.integer :def
      t.integer :level

      t.timestamps
    end
  end
end
