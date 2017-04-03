# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Seed orocessing started'
Address.create!(city: 'Jettiebury', street_name: 'Luettgen Viaduct', building_number: '4531',
                zip: '50875-2078', state: 'Colorado', country: 'Tuvalu')
address2 = Address.create!(city: 'Mohammedmouth', street_name: 'Cody Spring', building_number: '41526',
                           zip: '25525-3050', state: 'Massachusetts', country: 'Morocco')
address1 = Address.create!(city: 'Prosaccoborough', street_name: 'Ibrahim Shores', building_number: '721',
                           zip: '97742-4433', state: 'Alaska', country: 'Germany')

Item.create!(name: 'Alisa Bogan', weight: '4', priority: '1', status: 0,
             address_id: address2.id, delivery_address_id: address1.id)
Item.create!(name: 'Miss Sherwood Mayert', weight: '3', priority: '9', status: 0,
             address_id: address2.id, delivery_address_id: address1.id)
Item.create!(name: 'Mr. Jamil Reichert', weight: '0', priority: '3', status: 0,
             address_id: address2.id, delivery_address_id: address1.id)
puts 'Completed'
