# frozen_string_literal: true

class ProductUserList < ApplicationRecord
  belongs_to :user_list
  belongs_to :product

  class << self
    def save(user_list_id, product_id, new_quantity)
      attributes_product_user_list = { user_list_id: user_list_id, product_id: product_id }

      product_user_list = ProductUserList.where(attributes_product_user_list).first ||
        ProductUserList.new(attributes_product_user_list)

      new_quantity = product_user_list.quantity.to_i + new_quantity
      if new_quantity.zero?
        product_user_list.destroy
      else
        product_user_list.quantity = new_quantity
        product_user_list.save
      end

      new_quantity
    end
  end
end
