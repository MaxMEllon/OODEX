# frozen_string_literal: true
class CreateSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :submissions do |t|
      t.text :code, null: false
      t.references :player, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true
      t.integer :status, null: false, defailt: 0

      t.timestamps
    end
  end
end
