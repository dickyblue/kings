# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(name: 'Mandy', email: 'ming.f.huang@gmail.com', password: 'chicken128', admin: true)
User.create(name: 'Nate', email: 'nicholas.khuu@gmail.com', password: 'chicken128', admin: true)
User.create(name: 'Guest', email: 'minghuang08@gmail.com', password: 'chicken128', admin: false)
