# CATEGORIES
Category.create(name: "Snobby")
Category.create(name: "Rude")
Category.create(name: "Pretentious")
Category.create(name: "Arrogant")

#ITEMS: title, description, price, category_ids?

#SNOBBY
Item.create( title: "Donut1", price: 24,
  description: "Good for one 'splorer.", category_ids: ["1"])
Item.create( title: "Donut2", price: 5,
  description: "Farm fresh and ready to consume.", category_ids: ["1"])
Item.create( title: "Donut3", price: 19,
  description: "Great for a snack!", category_ids: ["1"])

#RUDE
Item.create( title: "Donut4", price: 75,
  description: "Plain ol' get-up for simple folk.", category_ids: ["2"])
Item.create( title: "Donut5", price: 250,
  description: "Good fer fendin' off 'coons and der sharp claws.", category_ids: ["2"])
Item.create( title: "Donut6", price: 25,
  description: "It gets rainy on the trail. Better bring a poncho.", category_ids: ["2"])

#PRETENTIOUS
Item.create( title: "Donut7", price: 150,
  description: "Big ol' gun, and loads of fun!", category_ids: ["3"])
Item.create( title: "Donut8", price: 500,
  description: "Great for fightin' off vermits!", category_ids: ["3"])
Item.create( title: "Donut9", price: 891,
  description: "Bandits ain't gonna be stealin' none of you'ns rations.", category_ids: ["3"])

#ARROGANT
Item.create( title: "Donut10", price: 98,
  description: "Good fer fur.", category_ids: ["3", "4"])
Item.create( title: "Donut11", price: 25,
  description: "Never git bit by a slippery snake 'gin!", category_ids: ["4"])
Item.create( title: "Donut12", price: 62,
  description: "West is where yer headed, so's ya know.", category_ids: ["4"])

# #RETIRED
# Item.create( title: "Donut13", price: 3000,
#   description: "Classy coat for the classy gent.", category_ids: ["1"], retired: true)

#USERS
# User.create(full_name: "Franklin Webber", email: "demoXX+franklin@jumpstartlab.com",
#   password: "password", role: :user, display_name: nil)
# User.create(full_name: "Jeff", email: "demoXX+jeff@jumpstartlab.com",
#   password: "password", role: :admin, display_name: "j3")
# User.create(full_name: "Steve Klabnik", email: "demoXX+steve@jumpstartlab.com",
#   password: "password", role: :superuser, display_name: "SkrilleX")
# User.create(full_name: "Katrina Owen", email: "demoXX+katrina@jumpstartlab.com",
  # password: "password", role: :user, display_name: "Ree-na")

# #ORDER ITEMS
##1
OrderItem.create(item_id: 1,
  order_id: 1, quantity: 3, unit_price: 24)
OrderItem.create(item_id: 2,
  order_id: 1, quantity: 4, unit_price: 200)
OrderItem.create(item_id: 3,
  order_id: 1, quantity: 5, unit_price: 500)
##2
OrderItem.create(item_id: 4,
  order_id: 2, quantity: 1, unit_price: 300)
OrderItem.create(item_id: 5,
  order_id: 2, quantity: 15, unit_price: 205)
OrderItem.create(item_id: 6,
  order_id: 2, quantity: 4, unit_price: 1000)
##3
OrderItem.create(item_id: 6,
  order_id: 3, quantity: 7, unit_price: 600)
OrderItem.create(item_id: 10,
  order_id: 3, quantity: 1, unit_price: 5)
##4
OrderItem.create(item_id: 1,
  order_id: 4, quantity: 1, unit_price: 377)
OrderItem.create(item_id: 9,
  order_id: 4, quantity: 1, unit_price: 111)
##5
OrderItem.create(item_id: 13,
  order_id: 5, quantity: 1, unit_price: 800)
##6
OrderItem.create(item_id: 12,
  order_id: 6, quantity: 6, unit_price: 123)
OrderItem.create(item_id: 11,
  order_id: 6, quantity: 2, unit_price: 111)
OrderItem.create(item_id: 10,
  order_id: 6, quantity: 2, unit_price: 89)
##7
OrderItem.create(item_id: 9,
  order_id: 7, quantity: 2, unit_price: 4)
##8
OrderItem.create(item_id: 8,
  order_id: 8, quantity: 20, unit_price: 800)
##9
OrderItem.create(item_id: 11,
  order_id: 9, quantity: 1, unit_price: 444)
OrderItem.create(item_id: 12,
  order_id: 10, quantity: 2, unit_price: 1230)
OrderItem.create(item_id: 3,
  order_id: 11, quantity: 3, unit_price: 500)
OrderItem.create(item_id: 10,
  order_id: 13, quantity: 4, unit_price: 110)
##10
OrderItem.create(item_id: 2,
  order_id: 12, quantity: 5, unit_price: 80)
OrderItem.create(item_id: 3,
  order_id: 14, quantity: 6, unit_price: 10)

#ORDERS
Order.create(user_id: 1, order_type: 'delivery', address_id: 1, status: "ordered", total: 3372)
Order.create(user_id: 2, order_type: 'delivery', address_id: 2, status: "ordered", total: 7375)
Order.create(user_id: 3, order_type: 'delivery', address_id: 3, status: "cancelled", total: 4205)
Order.create(user_id: 4, order_type: 'delivery', address_id: 4, status: "cancelled", total: 488)
Order.create(user_id: 5, order_type: 'delivery', address_id: 5, status: "paid", total: 800)
Order.create(user_id: 6, order_type: 'delivery', address_id: 6, status: "paid", total: 1138)
Order.create(user_id: 7, order_type: 'pickup', address_id: 7, status: "completed", total: 8)
Order.create(user_id: 8, order_type: 'pickup', address_id: 8, status: "completed", total: 16000)
Order.create(user_id: 9, order_type: 'pickup', address_id: 9, status: "ordered", total: 4844)
Order.create(user_id: 10, order_type: 'pickup', address_id: 10, status: "paid", total: 460)
