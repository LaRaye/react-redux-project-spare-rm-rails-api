# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Stay.create(cost: 100, title: 'sunny NYC apt', location: 'New York City')
Stay.create(cost: 210, title: '2bd LA condo w/ parking', location: 'Los Angeles')
Stay.create(cost: 395, title: 'ENTIRE ~4 bedroom 2 bath~', location: 'Poconos')
Stay.create(cost: 50, title: 'single room shared apt', location: 'Denver')

User.delete_all
vmars = User.create(username: "veronicamars", email: "vmars@gmail.com", password:"marshmellow")
sol = User.create(username: "solange", email: "sol@gmail.com", password:"knowles")
frankocean = User.create(username: "frankocean", email: "swimgood@gmail.com", password:"orange")

vmars.secrets.create(content: "who killed lily kane")
sol.secrets.create(content: "found my glory")
frankocean.secrets.create(content: "thinking bout you")
