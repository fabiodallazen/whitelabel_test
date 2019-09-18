# frozen_string_literal: true

class Product < ApplicationRecord
  include PgSearch

  belongs_to :subcategory
  has_many :product_user_lists

  pg_search_scope(
    :search_for,
    against: :description,
    using: {
      tsearch: { dictionary: 'english' },
      trigram: {
        threshold: 0.2
      }
    }
  )

  class << self
    def get_products(options = {})
      collection = Product.select('products.id', :description, :quantity).joins(
        <<-SQL
        LEFT JOIN product_user_lists
        ON product_user_lists.product_id = products.id
        AND product_user_lists.user_list_id = #{options[:user_list_id]}
      SQL
      )
      collection = collection.where(id: options[:products_id]) if options[:products_id]
      collection = collection.where(subcategory: options[:subcategory_id]) if options[:subcategory_id].present?
      collection = collection.search_for(options[:q]) if options[:q].present?
      collection
    end
  end
end
