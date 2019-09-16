# frozen_string_literal: true

class AddColumnNameInUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, limit: 100
  end
end
