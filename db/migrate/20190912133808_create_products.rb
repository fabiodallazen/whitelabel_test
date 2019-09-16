# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :subcategory, index: true, null: false
      t.foreign_key :subcategories

      t.string :description, limit: 100, null: false, unique: true

      t.timestamps
    end
  end
end
