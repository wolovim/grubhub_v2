# CATEGORIES
Category.create(name: "Mom's Favorites")
Category.create(name: "Donut's of Lore")
Category.create(name: "Gluten Free")
Category.create(name: "Classics")
Category.create(name: "House Specialties")
Category.create(name: "Extra Sprinkles")

#ITEMS

Item.create( title: "Chocolate", price: 2400,
  description: "Chocolate Fudge.",
  category_ids: ["1"])
Item.create( title: "Glazed", price: 500,
  description: "Lightly glazed.",
  category_ids: ["1", "4"])
Item.create( title: "Cinammon", price: 19000,
  description: "Covered with cinammon and sugar.", category_ids: ["1"])

Item.create( title: "Strawberry Jam", price: 7500,
  description: "Filled with strawberry jelly.", category_ids: ["2"])
Item.create( title: "Sauron's Delight", price: 2500,
  description: "Only the fires of Mordor could digest this.", category_ids: ["2","5"])
Item.create( title: "Chewybacca", price: 2500,
  description: "RRrRRGLRRr GLRrrrr rrrGHRR RrRRrr!", category_ids: ["2"])

Item.create( title: "Chocolate Chip", price: 177000,
  description: "Covered with chocolate chips.", category_ids: ["3"])
Item.create( title: "Blueberry Jam", price: 0,
  description: "Filled with blueberry jelly.", category_ids: ["3","5"])
Item.create( title: "Cotton Candy", price: 8910,
  description: "Covered with cotton candy flavored icing.", category_ids: ["3"])

Item.create( title: "Frosted Chocolate", price: 980,
  description: "Covered with chocolate icing.", category_ids: ["3", "4"])
Item.create( title: "Gorgeous", price: 2500,
  description: "Handcrafted to perfection.", category_ids: ["4"])
Item.create( title: "Oreo", price: 620,
  description: "Covered with crumbled Oreo cookies.", category_ids: ["4"])

# USERS
rachel = User.create(first_name: "Rachel", last_name: "Warbelow", email: "demo+rachel@jumpstartlab.com",
  password: "password", password_confirmation: "password", role: :default)
jeff = User.create(first_name: "Jeff", last_name: "Casimir", email: "demo+jeff@jumpstartlab.com",
  password: "password", password_confirmation: "password", role: :default, nickname: 'j3')
jorge = User.create(first_name: "Jorge", last_name: "Tellez", email: "demo+jorge@jumpstartlab.com",
  password: "password", password_confirmation: "password", role: :default, nickname: 'novohispano')
josh = User.create(first_name: "Josh", last_name: "Cheek", email: "demo+josh@jumpstartlab.com",
  password: "password", password_confirmation: "password", role: :admin, nickname: 'josh')

rachel_address1 = Address.create(street: '1510 Blake St', city: 'Denver', state: 'CO', zip: '80205', user: rachel)
rachel_address2 = Address.create(street: '198 Araphoe St', city: 'Denver', state: 'CO', zip: '80205', user: rachel)
jeff_address1 = Address.create(street: '3273 Lawrence St', city: 'Denver', state: 'CO', zip: '80205', user: jeff)
jeff_address2 = Address.create(street: '98 California St', city: 'Denver', state: 'CO', zip: '80205', user: jeff)
rachel_address3 = Address.create(street: '101 Stout St', city: 'Denver', state: 'CO', zip: '80205', user: rachel)
jorge_address = Address.create(street: '23 Colfax Ave', city: 'Denver', state: 'CO', zip: '80205', user: jorge)

users = User.all

10.times do {

}

#ORDERS
#rachel_order1 = Order.create(user: rachel, order_type: 'delivery', payment_type: 'cash', address: rachel_address1, status: "ordered")
#Order.create(user: rachel, order_type: 'delivery', payment_type: 'credit', address: rachel_address2, status: "ordered")
#Order.create(user: jeff, order_type: 'delivery', payment_type: 'credit', address: jeff_address1, status: "ordered")
#Order.create(user: jeff, order_type: 'delivery', payment_type: 'credit', address: jeff_address1, status: "ordered")
#Order.create(user: jeff, order_type: 'delivery', payment_type: 'cash', address: jeff_address1, status: "cancelled")
#Order.create(user: jorge, order_type: 'delivery', payment_type: 'cash', address: jorge_address, status: "cancelled")
#Order.create(user: jorge, order_type: 'delivery', payment_type: 'cash', address: jorge_address, status: "paid")
#Order.create(user: jorge, order_type: 'pickup', payment_type: 'cash', address: jorge_address, status: "completed")
#Order.create(user: jorge, order_type: 'pickup', payment_type: 'cash', address: jorge_address, status: "ordered")
#Order.create(user: jorge, order_type: 'pickup', payment_type: 'cash', address: jorge_address, status: "paid")
#
#
###ORDER ITEMS
###1
#rachel_order1.order_items.create(item_id: 1,
#  order_id: 1, quantity: 3, unit_price: 2400)
#OrderItem.create(item_id: 2,
#  order_id: 1, quantity: 4, unit_price: 2000)
#OrderItem.create(item_id: 3,
#  order_id: 1, quantity: 5, unit_price: 5000)
###2
#OrderItem.create(item_id: 4,
#  order_id: 2, quantity: 1, unit_price: 3000)
#OrderItem.create(item_id: 5,
#  order_id: 2, quantity: 15, unit_price: 2050)
#OrderItem.create(item_id: 6,
#  order_id: 2, quantity: 4, unit_price: 1000)
###3
#OrderItem.create(item_id: 6,
#  order_id: 3, quantity: 7, unit_price: 600)
#OrderItem.create(item_id: 10,
#  order_id: 3, quantity: 1, unit_price: 5000)
###4
#OrderItem.create(item_id: 1,
#  order_id: 4, quantity: 1, unit_price: 3770)
#OrderItem.create(item_id: 9,
#  order_id: 4, quantity: 1, unit_price: 1110)
###5
#OrderItem.create(item_id: 13,
#  order_id: 5, quantity: 1, unit_price: 8000)
###6
#OrderItem.create(item_id: 12,
#  order_id: 6, quantity: 6, unit_price: 1230)
#OrderItem.create(item_id: 11,
#  order_id: 6, quantity: 2, unit_price: 1110)
#OrderItem.create(item_id: 10,
#  order_id: 6, quantity: 2, unit_price: 8900)
###7
#OrderItem.create(item_id: 9,
#  order_id: 7, quantity: 2, unit_price: 4000)
###8
#OrderItem.create(item_id: 8,
#  order_id: 8, quantity: 20, unit_price: 8000)
###9
#OrderItem.create(item_id: 11,
#  order_id: 9, quantity: 1, unit_price: 4440)
#OrderItem.create(item_id: 12,
#  order_id: 10, quantity: 2, unit_price: 1230)
#OrderItem.create(item_id: 3,
#  order_id: 11, quantity: 3, unit_price: 5000)
#OrderItem.create(item_id: 10,
#  order_id: 13, quantity: 4, unit_price: 1100)
###10
#OrderItem.create(item_id: 2,
#  order_id: 12, quantity: 5, unit_price: 8000)
#OrderItem.create(item_id: 3,
#  order_id: 14, quantity: 6, unit_price: 1000)
