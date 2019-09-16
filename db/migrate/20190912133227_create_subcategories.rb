# frozen_string_literal: true

class CreateSubcategories < ActiveRecord::Migration[5.2]
  def change
    create_table :subcategories do |t|
      t.references :category, index: true, null: false
      t.foreign_key :categories

      t.string :description, limit: 100, null: false

      t.timestamps
    end

    add_index :subcategories, %i[category_id description], unique: true
  end
end
