# frozen_string_literal: true

class CreateUserLists < ActiveRecord::Migration[5.2]
  def change
    create_table :user_lists do |t|
      t.references :user, index: true, null: false
      t.foreign_key :users

      t.string :name, limit: 100, null: false
      t.string :notes, limit: 4000

      t.timestamps
    end

    add_index :user_lists, %i[user_id name], unique: true
  end
end
