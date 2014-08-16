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
# ##1
# OrderItem.create(product_id: 1, cart_id: nil,
#   order_id: 1, quantity: 3, price: 24)
# OrderItem.create(product_id: 2, cart_id: nil,
#   order_id: 1, quantity: 4, price: 200)
# OrderItem.create(product_id: 3, cart_id: nil,
#   order_id: 1, quantity: 5, price: 500)
# ##2
# OrderItem.create(product_id: 25, cart_id: nil,
#   order_id: 2, quantity: 1, price: 300)
# OrderItem.create(product_id: 26, cart_id: nil,
#   order_id: 2, quantity: 15, price: 205)
# OrderItem.create(product_id: 6, cart_id: nil,
#   order_id: 2, quantity: 4, price: 1000)
# ##3
# OrderItem.create(product_id: 7, cart_id: nil,
#   order_id: 3, quantity: 7, price: 600)
# OrderItem.create(product_id: 10, cart_id: nil,
#   order_id: 3, quantity: 1, price: 5)
# ##4
# OrderItem.create(product_id: 1, cart_id: nil,
#   order_id: 4, quantity: 1, price: 377)
# OrderItem.create(product_id: 15, cart_id: nil,
#   order_id: 4, quantity: 1, price: 111)
# ##5
# OrderItem.create(product_id: 13, cart_id: nil,
#   order_id: 5, quantity: 1, price: 800)
# ##6
# OrderItem.create(product_id: 12, cart_id: nil,
#   order_id: 6, quantity: 6, price: 123)
# OrderItem.create(product_id: 11, cart_id: nil,
#   order_id: 6, quantity: 2, price: 111)
# OrderItem.create(product_id: 17, cart_id: nil,
#   order_id: 6, quantity: 2, price: 89)
# ##7
# OrderItem.create(product_id: 9, cart_id: nil,
#   order_id: 7, quantity: 2, price: 4)
# ##8
# OrderItem.create(product_id: 8, cart_id: nil,
#   order_id: 8, quantity: 20, price: 800)
# ##9
# OrderItem.create(product_id: 31, cart_id: nil,
#   order_id: 9, quantity: 1, price: 444)
# OrderItem.create(product_id: 32, cart_id: nil,
#   order_id: 9, quantity: 2, price: 1230)
# OrderItem.create(product_id: 33, cart_id: nil,
#   order_id: 9, quantity: 3, price: 500)
# OrderItem.create(product_id: 10, cart_id: nil,
#   order_id: 9, quantity: 4, price: 110)
# ##10
# OrderItem.create(product_id: 24, cart_id: nil,
#   order_id: 10, quantity: 5, price: 80)
# OrderItem.create(product_id: 23, cart_id: nil,
#   order_id: 10, quantity: 6, price: 10)

# #ORDERS
# Order.create(status: "pending", user_id: 1, total_cost: 3372)
# Order.create(status: "pending", user_id: 4, total_cost: 7375)
# Order.create(status: "cancelled", user_id: 1, total_cost: 4205)
# Order.create(status: "cancelled", user_id: 1, total_cost: 488)
# Order.create(status: "paid", user_id: 4, total_cost: 800)
# Order.create(status: "paid", user_id: 1, total_cost: 1138)
# Order.create(status: "shipped", user_id: 4, total_cost: 8)
# Order.create(status: "shipped", user_id: 4, total_cost: 16000)
# Order.create(status: "returned", user_id: 1, total_cost: 4844)
# Order.create(status: "returned", user_id: 4, total_cost: 460)