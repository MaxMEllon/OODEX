# frozen_string_literal: true
class CreateContests < ActiveRecord::Migration[5.0]
  def change
    create_table :contests do |t|
      t.datetime :start_at, null: false
      t.datetime :end_at, null: false
      t.boolean :is_active, null: false, default: false

      t.timestamps
    end
  end
end
