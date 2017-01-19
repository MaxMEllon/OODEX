# frozen_string_literal: true
class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.boolean :is_active, default: true, null: false
      t.string :name, null: false
      t.integer :role, default: 0, null: false
      t.integer :user_id, null: false
      t.integer :contest_id, null: false

      t.timestamps
    end

    add_index :players, :user_id
    add_index :players, :contest_id
  end
end
