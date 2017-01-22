# frozen_string_literal: true
class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name, null: false, defualt: ''
      t.integer :contest_id, null: false

      t.timestamps
    end

    add_index :teams, :contest_id
  end
end
