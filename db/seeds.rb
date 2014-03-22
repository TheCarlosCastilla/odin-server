# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ValidUser.delete_all

ValidUser.create!(imei: "358392044154754", is_registered: false)
ValidUser.create!(imei: "357710863398130", is_registered: false)
ValidUser.create!(imei: "359939040356020", is_registered: false)
ValidUser.create!(imei: "352678029014864", is_registered: false)
ValidUser.create!(imei: "359939040357614", is_registered: false)
ValidUser.create!(imei: "359939040356053", is_registered: false)