# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless User.where(email: 'teste@teste.com').exists?
  User.create!(email: 'teste@teste.com', name: 'Teste', password: '123456789')
end

category = Category.create!(description: 'Utilidades do Lar')

description = 'Decoração'
subcategory = Subcategory.find_by(category: category, description: description) || Subcategory.create!(category: category, description: description)
rand(100).times.each { Product.create!(subcategory: subcategory, description: FFaker::Product.brand) }

description = 'Cutelaria'
subcategory = Subcategory.find_by(category: category, description: description) || Subcategory.create!(category: category, description: description)
rand(100).times.each { Product.create!(subcategory: subcategory, description: FFaker::Product.brand) }

description = 'Forno e Fogão'
subcategory = Subcategory.find_by(category: category, description: description) || Subcategory.create!(category: category, description: description)
rand(100).times.each { Product.create!(subcategory: subcategory, description: FFaker::Product.brand) }

description = 'Copa e Cozinha'
subcategory = Subcategory.find_by(category: category, description: description) || Subcategory.create!(category: category, description: description)
rand(100).times.each { Product.create!(subcategory: subcategory, description: FFaker::Product.brand) }

description = 'Lavanderia e Banheiro'
subcategory = Subcategory.find_by(category: category, description: description) || Subcategory.create!(category: category, description: description)
rand(100).times.each { Product.create!(subcategory: subcategory, description: FFaker::Product.brand) }

description = 'Mesa e Bar'
subcategory = Subcategory.find_by(category: category, description: description) || Subcategory.create!(category: category, description: description)
rand(100).times.each { Product.create!(subcategory: subcategory, description: FFaker::Product.brand) }

category = Category.create!(description: 'Cama, Mesa e Banho')

description = 'Decoração'
subcategory = Subcategory.find_by(category: category, description: description) || Subcategory.create!(category: category, description: description)
rand(100).times.each { Product.create!(subcategory: subcategory, description: FFaker::Product.brand) }

description = 'Cama'
subcategory = Subcategory.find_by(category: category, description: description) || Subcategory.create!(category: category, description: description)
rand(100).times.each { Product.create!(subcategory: subcategory, description: FFaker::Product.brand) }

description = 'Banho'
subcategory = Subcategory.find_by(category: category, description: description) || Subcategory.create!(category: category, description: description)
rand(100).times.each { Product.create!(subcategory: subcategory, description: FFaker::Product.brand) }

description = 'Mesa'
subcategory = Subcategory.find_by(category: category, description: description) || Subcategory.create!(category: category, description: description)
rand(100).times.each { Product.create!(subcategory: subcategory, description: FFaker::Product.brand) }

category = Category.create!(description: 'Lingerie')

description = 'Lingerie Noite'
subcategory = Subcategory.find_by(category: category, description: description) || Subcategory.create!(category: category, description: description)
rand(100).times.each { Product.create!(subcategory: subcategory, description: FFaker::Product.brand) }

description = 'Lingerie Dia'
subcategory = Subcategory.find_by(category: category, description: description) || Subcategory.create!(category: category, description: description)
rand(100).times.each { Product.create!(subcategory: subcategory, description: FFaker::Product.brand) }

description = 'Marca de terceiros'
subcategory = Subcategory.find_by(category: category, description: description) || Subcategory.create!(category: category, description: description)
rand(100).times.each { Product.create!(subcategory: subcategory, description: FFaker::Product.brand) }
