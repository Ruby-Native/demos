puts "Seeding Daily Grind..."

# Default user
user = User.find_or_create_by!(email: "coffee@example.com") do |u|
  u.name = "Alex"
  u.password = "password"
  u.password_confirmation = "password"
  u.favorite_store = "Downtown"
  u.reward_points = 340
end

# Categories
espresso = Category.find_or_create_by!(name: "Espresso") do |c|
  c.description = "Rich, bold espresso-based drinks"
  c.image_url = "menu/espresso.jpg"
  c.position = 1
end

brewed = Category.find_or_create_by!(name: "Brewed") do |c|
  c.description = "Classic drip and pour over coffees"
  c.image_url = "menu/brewed.jpg"
  c.position = 2
end

cold = Category.find_or_create_by!(name: "Cold") do |c|
  c.description = "Refreshing iced and blended drinks"
  c.image_url = "menu/cold.jpg"
  c.position = 3
end

pastries = Category.find_or_create_by!(name: "Pastries") do |c|
  c.description = "Freshly baked treats"
  c.image_url = "menu/pastries.jpg"
  c.position = 4
end

tea = Category.find_or_create_by!(name: "Tea") do |c|
  c.description = "Fine teas and tea lattes"
  c.image_url = "menu/tea.jpg"
  c.position = 5
end

# Espresso drinks
espresso_shot = Product.find_or_create_by!(name: "Espresso", category: espresso) do |p|
  p.description = "A single or double shot of rich, concentrated coffee."
  p.base_price = 325
  p.image_url = "menu/espresso_shot.jpg"
  p.position = 1
end

americano = Product.find_or_create_by!(name: "Americano", category: espresso) do |p|
  p.description = "Espresso with hot water for a smooth, bold flavor."
  p.base_price = 395
  p.image_url = "menu/americano.jpg"
  p.position = 2
end

cappuccino = Product.find_or_create_by!(name: "Cappuccino", category: espresso) do |p|
  p.description = "Equal parts espresso, steamed milk, and velvety foam."
  p.base_price = 495
  p.image_url = "menu/cappuccino.jpg"
  p.position = 3
end

latte = Product.find_or_create_by!(name: "Latte", category: espresso) do |p|
  p.description = "Smooth espresso with steamed milk and a light layer of foam."
  p.base_price = 525
  p.image_url = "menu/latte.jpg"
  p.position = 4
end

mocha = Product.find_or_create_by!(name: "Mocha", category: espresso) do |p|
  p.description = "Espresso with chocolate and steamed milk, topped with whipped cream."
  p.base_price = 575
  p.image_url = "menu/mocha.jpg"
  p.position = 5
end

# Brewed coffees
drip = Product.find_or_create_by!(name: "Drip coffee", category: brewed) do |p|
  p.description = "Our house blend, brewed fresh throughout the day."
  p.base_price = 275
  p.image_url = "menu/drip_coffee.jpg"
  p.position = 1
end

pour_over = Product.find_or_create_by!(name: "Pour over", category: brewed) do |p|
  p.description = "Hand-poured for a clean, nuanced cup."
  p.base_price = 450
  p.image_url = "menu/pour_over.jpg"
  p.position = 2
end

french_press = Product.find_or_create_by!(name: "French press", category: brewed) do |p|
  p.description = "Full-bodied and rich, steeped to perfection."
  p.base_price = 425
  p.image_url = "menu/french_press.jpg"
  p.position = 3
end

# Cold drinks
cold_brew = Product.find_or_create_by!(name: "Cold brew", category: cold) do |p|
  p.description = "Slow-steeped for 20 hours. Smooth and naturally sweet."
  p.base_price = 475
  p.image_url = "menu/cold_brew.jpg"
  p.position = 1
end

iced_latte = Product.find_or_create_by!(name: "Iced latte", category: cold) do |p|
  p.description = "Espresso poured over ice with cold milk."
  p.base_price = 525
  p.image_url = "menu/iced_latte.jpg"
  p.position = 2
end

frappe = Product.find_or_create_by!(name: "Frappe", category: cold) do |p|
  p.description = "Blended iced coffee with milk and your choice of flavor."
  p.base_price = 595
  p.image_url = "menu/frappe.jpg"
  p.position = 3
end

# Pastries
croissant = Product.find_or_create_by!(name: "Butter croissant", category: pastries) do |p|
  p.description = "Flaky, golden, and baked fresh every morning."
  p.base_price = 375
  p.image_url = "menu/croissant.jpg"
  p.position = 1
end

muffin = Product.find_or_create_by!(name: "Blueberry muffin", category: pastries) do |p|
  p.description = "Bursting with blueberries and topped with streusel."
  p.base_price = 350
  p.image_url = "menu/muffin.jpg"
  p.position = 2
end

scone = Product.find_or_create_by!(name: "Cranberry scone", category: pastries) do |p|
  p.description = "Tender and flaky with tart cranberries and orange zest."
  p.base_price = 375
  p.image_url = "menu/scone.jpg"
  p.position = 3
end

cookie = Product.find_or_create_by!(name: "Chocolate chip cookie", category: pastries) do |p|
  p.description = "Warm, chewy, and loaded with chocolate chips."
  p.base_price = 325
  p.image_url = "menu/cookie.jpg"
  p.position = 4
end

# Teas
green_tea = Product.find_or_create_by!(name: "Green tea", category: tea) do |p|
  p.description = "Light and refreshing Japanese sencha."
  p.base_price = 350
  p.image_url = "menu/green_tea.jpg"
  p.position = 1
end

chai = Product.find_or_create_by!(name: "Chai latte", category: tea) do |p|
  p.description = "Spiced black tea with steamed milk and a touch of honey."
  p.base_price = 495
  p.image_url = "menu/chai_latte.jpg"
  p.position = 2
end

matcha = Product.find_or_create_by!(name: "Matcha latte", category: tea) do |p|
  p.description = "Ceremonial grade matcha whisked with steamed milk."
  p.base_price = 550
  p.image_url = "menu/matcha_latte.jpg"
  p.position = 3
end

# Completed past orders
3.times do |i|
  order = user.orders.create!(
    status: :completed,
    placed_at: (i + 1).weeks.ago,
    total: 0
  )

  products = Product.all.sample(rand(2..4))
  products.each do |product|
    item = order.order_items.create!(
      product: product,
      size: %w[small medium large].sample,
      milk: %w[Whole Oat Almond].sample,
      quantity: 1,
      unit_price: product.base_price
    )

    if rand < 0.4
      item.order_item_extras.create!(name: "Vanilla syrup", price: 70)
    end
  end

  order.recalculate_total!
end

# Active "preparing" order
active_order = user.orders.create!(
  status: :preparing,
  placed_at: 15.minutes.ago,
  total: 0
)

latte_item = active_order.order_items.create!(
  product: latte,
  size: :medium,
  milk: "Oat",
  quantity: 1,
  unit_price: latte.base_price
)
latte_item.order_item_extras.create!(name: "Vanilla syrup", price: 70)

active_order.order_items.create!(
  product: croissant,
  size: :medium,
  milk: nil,
  quantity: 1,
  unit_price: croissant.base_price
)

active_order.recalculate_total!

# Reward activities
activities = [
  {description: "Order ##{active_order.id}", points: 15, created_at: 15.minutes.ago},
  {description: "Bonus: 5th visit this week", points: 50, created_at: 2.days.ago},
  {description: "Order placed", points: 10, created_at: 3.days.ago},
  {description: "Redeemed: Free drip coffee", points: -150, created_at: 5.days.ago},
  {description: "Order placed", points: 15, created_at: 1.week.ago},
  {description: "Order placed", points: 10, created_at: 1.week.ago},
  {description: "Referral bonus", points: 100, created_at: 2.weeks.ago},
  {description: "Order placed", points: 15, created_at: 2.weeks.ago},
  {description: "Order placed", points: 10, created_at: 3.weeks.ago},
  {description: "Welcome bonus", points: 50, created_at: 1.month.ago}
]

activities.each do |attrs|
  user.reward_activities.create!(attrs)
end

puts "Seeded #{Category.count} categories, #{Product.count} products, #{Order.count} orders, #{RewardActivity.count} reward activities."
