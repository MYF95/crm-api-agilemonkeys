# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'admin@test.com', password: 'password', admin: true)

customer1 = Customer.create(name: 'Ponsan', surname: 'The dog', created_by: 1, updated_by: 1)
customer2 = Customer.create(name: 'Tsukki', surname: 'The dog', created_by: 1, updated_by: 1)
customer1.avatar.attach({io: File.open("#{Rails.root}/public/images/default_avatar.png"), filename: 'default_avatar'})
customer2.avatar.attach({io: File.open("#{Rails.root}/public/images/default_avatar.png"), filename: 'default_avatar'})