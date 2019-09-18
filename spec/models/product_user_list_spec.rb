require 'rails_helper'

RSpec.describe ProductUserList, type: :model do
  it "is invalid if the quantity is not greater than 0" do
    user = User.create!(email: 'teste@teste.com', name: 'Teste', password: '123456789')
    user_list = UserList.create(user: user, name: 'teste')

    category = Category.create!(description: 'Utilidades do Lar')
    subcategory = Subcategory.create!(category: category, description: 'description')
    product = Product.create!(subcategory: subcategory, description: Faker::Commerce.product_name)

    expect(ProductUserList.create(user_list: user_list, product: product, quantity: 0)).not_to be_valid
  end
end
