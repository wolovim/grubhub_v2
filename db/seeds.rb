# CATEGORIES
Category.create(name: "Your Mom's Favorites")
Category.create(name: "Donut's of Lore")
Category.create(name: "You Probably Can't Afford")
Category.create(name: "These Donuts Are Above You")
Category.create(name: "Donuts We Wont Sell You")
Category.create(name: "Donuts We Wont Even Show You")

#ITEMS

#Moms Favs
Item.create( title: "The Mangler", price: 2400,
  description: "One bite, all the mangles. Just like mom used to make.",
  category_ids: ["1"])
Item.create( title: "The Enola Gay", price: 500,
  description: "Droppin' bombs in your mouth.",
  category_ids: ["1", "4"])
Item.create( title: "The BroNut", price: 19000,
  description: "Comes with 5lbs of Whey Protien and a BowFlex.", category_ids: ["1"])

#Lore
Item.create( title: "Unicorn Bitty", price: 7500,
  description: "Made from real bits of unicorn.", category_ids: ["2"])
Item.create( title: "Sauron's Delight", price: 2500,
  description: "Only the fires of Mordor could digest this.", category_ids: ["2","5"])
Item.create( title: "Chewybacca", price: 2500,
  description: "RRrRRGLRRr GLRrrrr rrrGHRR RrRRrr!", category_ids: ["2"])

#Afford Expensive
Item.create( title: "Diamond Mine", price: 177000,
  description: "One diamond in every bite.", category_ids: ["3"])
Item.create( title: "Lucky Louvre", price: 0,
  description: "Made from priceless ground artifacts.", category_ids: ["3","5"])
Item.create( title: "Benji Bite", price: 8910,
  description: "$100 bills, ground into meal, fried to perfection.", category_ids: ["3"])

#Above you
Item.create( title: "Fronut", price: 980,
  description: "Free afro pick with purchase.", category_ids: ["3", "4"])
Item.create( title: "Gorgeous", price: 2500,
  description: "Unlike your face.", category_ids: ["4"])
Item.create( title: "The Harvard", price: 620,
  description: "Has read more books than you.", category_ids: ["4"])

# USERS
User.create(first_name: "Rachel", last_name: "Warbelow", email: "demo+rachel@jumpstartlab.com",
  password: "password", password_confirmation: "password", role: :default)
User.create(first_name: "Jeff", last_name: "Casimir", email: "demo+jeff@jumpstartlab.com",
  password: "password", password_confirmation: "password", role: :default, nickname: 'j3')
User.create(first_name: "Jorge", last_name: "Tellez", email: "demo+jorge@jumpstartlab.com",
  password: "password", password_confirmation: "password", role: :default, nickname: 'novohispano')
User.create(first_name: "Josh", last_name: "Cheek", email: "demo+josh@jumpstartlab.com",
  password: "password", password_confirmation: "password", role: :admin, nickname: 'josh')
User.create(first_name: "Joe", last_name: "Shmoe", email: "yourdad@aol.com",
  password: "password", password_confirmation: "password", role: :default, nickname: 'DudeGuy')
User.create(first_name: "Barbra", last_name: "Streisand", email: "yourmom@aol.com",
  password: "password", password_confirmation: "password", role: :admin, nickname: 'Barb')



##ORDER ITEMS
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
Order.create(user_id: 1, order_type: 'delivery', payment_type: 'cash', address_id: 1, status: "ordered")
Order.create(user_id: 2, order_type: 'delivery', payment_type: 'credit', address_id: 2, status: "ordered")
Order.create(user_id: 2, order_type: 'delivery', payment_type: 'credit', address_id: 2, status: "ordered")
Order.create(user_id: 5, order_type: 'delivery', payment_type: 'credit', address_id: 2, status: "ordered")
Order.create(user_id: 2, order_type: 'delivery', payment_type: 'credit', address_id: 2, status: "ordered")
Order.create(user_id: 3, order_type: 'delivery', payment_type: 'cash', address_id: 3, status: "cancelled")
Order.create(user_id: 4, order_type: 'delivery', payment_type: 'cash', address_id: 4, status: "cancelled")
Order.create(user_id: 5, order_type: 'delivery', payment_type: 'cash', address_id: 5, status: "paid")
Order.create(user_id: 3, order_type: 'delivery', payment_type: 'credit', address_id: 6, status: "paid")
Order.create(user_id: 5, order_type: 'pickup', payment_type: 'cash', address_id: 7, status: "completed")
Order.create(user_id: 5, order_type: 'pickup', payment_type: 'credit', address_id: 8, status: "completed")
Order.create(user_id: 2, order_type: 'pickup', payment_type: 'cash', address_id: 9, status: "ordered")
Order.create(user_id: 3, order_type: 'pickup', payment_type: 'cash', address_id: 10, status: "paid")

Address.create(street: '1510 Blake St', city: 'Denver', state: 'CO', zip: '80205', user_id: 2)
Address.create(street: '198 Araphoe St', city: 'Denver', state: 'CO', zip: '80205', user_id: 2)
Address.create(street: '3273 Lawrence St', city: 'Denver', state: 'CO', zip: '80205', user_id: 3)
Address.create(street: '98 California St', city: 'Denver', state: 'CO', zip: '80205', user_id: 4)
Address.create(street: '101 Stout St', city: 'Denver', state: 'CO', zip: '80205', user_id: 5)
Address.create(street: '23 Colfax Ave', city: 'Denver', state: 'CO', zip: '80205', user_id: 6)
Address.create(street: '52 Park Ave', city: 'Denver', state: 'CO', zip: '80205', user_id: 7)
Address.create(street: '982 Curtis St', city: 'Denver', state: 'CO', zip: '80205', user_id: 9)
Address.create(street: '29 Wynkoop', city: 'Denver', state: 'CO', zip: '80205', user_id: 8)
Address.create(street: '10 Wewatta', city: 'Denver', state: 'CO', zip: '80205', user_id: 3)
