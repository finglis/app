# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Item.create(name: "shiney socks", quantity: 5, price:5, offer:No)
Item.create(name: "something else", quantity: 5, price:5, offer:No)
Item.create(name: "hat", quantity: 5, price:5, offer:No)


Customer.create(number: 1001, loyalty: true)
Customer.create(number: 1002, loyalty: false)
Customer.create(number: 1003, loyalty: false)
Customer.create(number: 1004, loyalty: false)

Store.create(name: Edinburgh)