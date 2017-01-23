# frozen_string_literal: true
class CreateSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :subjects do |t|
      t.string :title, null: false
      t.text :detail, null: false
      t.references :contest, index: true, foreign_key: true

      t.timestamps
    end
  end
end
