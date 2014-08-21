# CATEGORIES
Category.create(name: "Snobby")
Category.create(name: "Rude")
Category.create(name: "Pretentious")
Category.create(name: "Arrogant")

#ITEMS

#SNOBBY
Item.create( title: "Donut1", price: 2400,
  description: "Good for one 'splorer.", category_ids: ["1"])
Item.create( title: "Donut2", price: 500,
  description: "Farm fresh and ready to consume.", category_ids: ["1"])
Item.create( title: "Donut3", price: 19000,
  description: "Great for a snack!", category_ids: ["1"])

#RUDE
Item.create( title: "Donut4", price: 7500,
  description: "Plain ol' get-up for simple folk.", category_ids: ["2"])
Item.create( title: "Donut5", price: 2500,
  description: "Good fer fendin' off 'coons and der sharp claws.", category_ids: ["2"])
Item.create( title: "Donut6", price: 2500,
  description: "It gets rainy on the trail. Better bring a poncho.", category_ids: ["2"])

#PRETENTIOUS
Item.create( title: "Donut7", price: 1500,
  description: "Big ol' gun, and loads of fun!", category_ids: ["3"])
Item.create( title: "Donut8", price: 5000,
  description: "Great for fightin' off vermits!", category_ids: ["3"])
Item.create( title: "Donut9", price: 8910,
  description: "Bandits ain't gonna be stealin' none of you'ns rations.", category_ids: ["3"])

#ARROGANT
Item.create( title: "Donut10", price: 980,
  description: "Good fer fur.", category_ids: ["3", "4"])
Item.create( title: "Donut11", price: 2500,
  description: "Never git bit by a slippery snake 'gin!", category_ids: ["4"])
Item.create( title: "Donut12", price: 620,
  description: "West is where yer headed, so's ya know.", category_ids: ["4"])

# #RETIRED
# Item.create( title: "Donut13", price: 3000,
#   description: "Classy coat for the classy gent.", category_ids: ["1"], retired: true)

# USERS
User.create(first_name: "Nando", last_name: "Hasselhoff", email: "yourmom@aol.com",
  password: "password", password_confirmation: "password", role: :admin, nickname: "Nandozer")
User.create(first_name: "Joe", last_name: "Shmoe", email: "yourdad@aol.com",
  password: "password", password_confirmation: "password", role: :default, nickname: "Guy")


# #ORDER ITEMS
##1
OrderItem.create(item_id: 1,
  order_id: 1, quantity: 3, unit_price: 2400)
OrderItem.create(item_id: 2,
  order_id: 1, quantity: 4, unit_price: 2000)
OrderItem.create(item_id: 3,
  order_id: 1, quantity: 5, unit_price: 5000)
##2
OrderItem.create(item_id: 4,
  order_id: 2, quantity: 1, unit_price: 3000)
OrderItem.create(item_id: 5,
  order_id: 2, quantity: 15, unit_price: 2050)
OrderItem.create(item_id: 6,
  order_id: 2, quantity: 4, unit_price: 1000)
##3
OrderItem.create(item_id: 6,
  order_id: 3, quantity: 7, unit_price: 600)
OrderItem.create(item_id: 10,
  order_id: 3, quantity: 1, unit_price: 5000)
##4
OrderItem.create(item_id: 1,
  order_id: 4, quantity: 1, unit_price: 3770)
OrderItem.create(item_id: 9,
  order_id: 4, quantity: 1, unit_price: 1110)
##5
OrderItem.create(item_id: 13,
  order_id: 5, quantity: 1, unit_price: 8000)
##6
OrderItem.create(item_id: 12,
  order_id: 6, quantity: 6, unit_price: 1230)
OrderItem.create(item_id: 11,
  order_id: 6, quantity: 2, unit_price: 1110)
OrderItem.create(item_id: 10,
  order_id: 6, quantity: 2, unit_price: 8900)
##7
OrderItem.create(item_id: 9,
  order_id: 7, quantity: 2, unit_price: 4000)
##8
OrderItem.create(item_id: 8,
  order_id: 8, quantity: 20, unit_price: 8000)
##9
OrderItem.create(item_id: 11,
  order_id: 9, quantity: 1, unit_price: 4440)
OrderItem.create(item_id: 12,
  order_id: 10, quantity: 2, unit_price: 1230)
OrderItem.create(item_id: 3,
  order_id: 11, quantity: 3, unit_price: 5000)
OrderItem.create(item_id: 10,
  order_id: 13, quantity: 4, unit_price: 1100)
##10
OrderItem.create(item_id: 2,
  order_id: 12, quantity: 5, unit_price: 8000)
OrderItem.create(item_id: 3,
  order_id: 14, quantity: 6, unit_price: 1000)

#ORDERS
Order.create(user_id: 1, order_type: 'delivery', address_id: 1, status: "ordered", total: 3372)
Order.create(user_id: 2, order_type: 'delivery', address_id: 2, status: "ordered", total: 7375)
Order.create(user_id: 3, order_type: 'delivery', address_id: 3, status: "cancelled", total: 4205)
Order.create(user_id: 4, order_type: 'delivery', address_id: 4, status: "cancelled", total: 4880)
Order.create(user_id: 5, order_type: 'delivery', address_id: 5, status: "paid", total: 8000)
Order.create(user_id: 6, order_type: 'delivery', address_id: 6, status: "paid", total: 1138)
Order.create(user_id: 7, order_type: 'pickup', address_id: 7, status: "completed", total: 8000)
Order.create(user_id: 8, order_type: 'pickup', address_id: 8, status: "completed", total: 16000)
Order.create(user_id: 9, order_type: 'pickup', address_id: 9, status: "ordered", total: 4844)
Order.create(user_id: 10, order_type: 'pickup', address_id: 10, status: "paid", total: 4600)
