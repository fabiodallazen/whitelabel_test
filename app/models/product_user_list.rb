# frozen_string_literal: true

class ProductUserList < ApplicationRecord
  belongs_to :user_list
  belongs_to :product
end
