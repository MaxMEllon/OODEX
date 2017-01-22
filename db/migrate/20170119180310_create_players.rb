# frozen_string_literal: true
class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.boolean :is_active, default: true, null: false
      t.string :name, null: false
      t.integer :role, default: 0, null: false
      t.references :user, index: true, foreign_key: true
      t.references :team, index: true, foreign_key: true

      t.timestamps
    end
  end
end
