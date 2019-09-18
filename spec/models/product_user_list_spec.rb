require 'rails_helper'

RSpec.describe ProductUserList, type: :model do
  it "is invalid if the quantity is not greater than 0" do
    user = User.create!(email: FFaker::Internet.email, name: FFaker::Name.first_name, password: FFaker::Internet.password)
    user_list = UserList.create(user: user, name: FFaker::Lorem.word)

    category = Category.create!(description: FFaker::Lorem.word)
    subcategory = Subcategory.create!(category: category, description: FFaker::Lorem.word)
    product = Product.create!(subcategory: subcategory, description: FFaker::Product.brand)

    product_user_list = ProductUserList.new(user_list: user_list, product: product, quantity: FFaker::Random.rand(-100..0))
    
    expect(product_user_list).not_to be_valid
  end
end
