# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Article.create(user_id: 1, url: "https://m.ftchinese.com/premium/001085449?exclusive")
Article.create(user_id: 1, url: "https://cn.engadget.com/2019/12/02/stellar-black-hole-is-larger-than-science-expected/")
Article.create(user_id: 1, url: "https://cn.engadget.com/2013/05/23/logitech-wired-ipad-keyboard/")
Article.create(user_id: 1, url: "https://cn.engadget.com/2019/12/05/nasa-parker-solar-probe-results/")

User.create(email: "hillary@gmail.com", password: "123123")
User.create(email: "steve@gmail.com", password: "123123")
User.create(email: "mark@gmail.com", password: "123123")
