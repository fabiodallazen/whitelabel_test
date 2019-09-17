# frozen_string_literal: true

class UserList < ApplicationRecord
  belongs_to :user
  has_many :product_user_lists, dependent: :destroy
end
