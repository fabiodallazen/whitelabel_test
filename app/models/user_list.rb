# frozen_string_literal: true

class UserList < ApplicationRecord
  belongs_to :user
  has_many :product_user_lists, dependent: :destroy

  validates :user_id, presence: true
  validates :name, length: { maximum: 100 }, presence: true
  validates :name, uniqueness: { scope: [:name, :user_id], message: '%{value} já está em uso.' }
end
