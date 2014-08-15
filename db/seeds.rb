# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Bean.destroy_all
beans = Bean.create([
  {name: "Cheap Blend", roast: "dark", origin: "varies", quantity: "1.0"}, 
  {name: "Rainy Day", roast: "light", origin: "Panama", quantity: "40" },
  {name: "Dark Killer", roast: "dark", origin: "Sumatra", quantity: "23" },
  {name: "WDI Special Blend", roast: "dark", origin: "Kenya", quantity: "20" },
  {name: "Super Plus", roast: "dark", origin: "Java", quantity: "10.5" },
  {name: "Columbiano", roast: "light", origin: "Columbia", quantity: "0" },  
  {name: "Jamaica Blue", roast: "light", origin: "Jamaica", quantity: "0" },  
  {name: "Kenya Reserve", roast: "light", origin: "Kenya", quantity: "8" },
  {name: "Garuda", roast: "dark", origin: "Indonesia", quantity: "4" },  
  {name: "Panama Reserve", roast: "light", origin: "Panama", quantity: "14" },
  {name: "GA Standard", roast: "dark", origin: "Java", quantity: "23" }  
  ])

Pastry.destroy_all
pastries = Pastry.create([
  {name: "Croisant", type: "Bakery"}, 
  {name: "Blueberry Muffin", type: "Bakery"}, 
  {name: "Mango Magic", type: "Juice"}, 
  {name: "Ham & Cheese Sandwich", type: "Meals"}  
  ])

Pairing.destroy_all
# These 3 do the exact same thing
Pairing.create(bean: Bean.all[2], pastry: Pastry.first)
#Pastry.first.pairings.create(bean: Bean.all[2])
#Bean.all[2].pairings.create(pastry: Pastry.first)

