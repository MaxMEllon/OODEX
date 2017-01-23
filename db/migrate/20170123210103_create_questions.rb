# frozen_string_literal: true
class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.references :subject, index: true, foreign_key: true

      t.timestamps
    end
  end
end
