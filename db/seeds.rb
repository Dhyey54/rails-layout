# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

5.times do |u|
  User.create(username: "User#{u+1}", email: "user#{u+1}@gmail.com", password: '112233', role: rand(0..1))
end

10.times do |p|
  Product.create(title: "Product #{p+1}", description: "It is the description of #{p} commodity", price: rand(500..10_000).ceil(-3))
end

30.times do
  Order.create(quantity: rand(1..30), status: rand(0..1), product_id: Product.ids.sample, user_id: User.ids.sample)
end
