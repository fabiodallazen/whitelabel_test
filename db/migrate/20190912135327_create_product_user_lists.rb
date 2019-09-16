# frozen_string_literal: true

class CreateProductUserLists < ActiveRecord::Migration[5.2]
  def change
    create_table :product_user_lists do |t|
      t.integer :user_list_id, index: true, null: false
      t.references :product, index: true, null: false
      t.foreign_key :products

      t.integer :quantity, null: false

      t.timestamps
    end

    add_foreign_key :product_user_lists, :user_lists, column: :user_list_id

    add_index :product_user_lists, %i[product_id user_list_id], unique: true
  end
end
