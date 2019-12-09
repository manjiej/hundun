# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning all database.."
Article.destroy_all
User.destroy_all
Summary.destroy_all

puts "Creating database..."

# Article.create(url: "https://m.ftchinese.com/premium/001085449?exclusive")
# Article.create(url: "https://cn.engadget.com/2019/12/02/stellar-black-hole-is-larger-than-science-expected/")
# Article.create(url: "https://cn.engadget.com/2013/05/23/logitech-wired-ipad-keyboard/")
# Article.create(url: "https://cn.engadget.com/2019/12/05/nasa-parker-solar-probe-results/")

User.create(email: "hillary@gmail.com", password: "123123") #user_id: 38
User.create(email: "steve@gmail.com", password: "123123")
User.create(email: "mark@gmail.com", password: "123123")

Summary.create(user_id: 38, article_url: "https://m.ftchinese.com/premium/001085449?exclusive")
Summary.create(user_id: 38, article_url: "https://cn.engadget.com/2019/12/02/stellar-black-hole-is-larger-than-science-expected/")
Summary.create(user_id: 38, article_url: "https://cn.engadget.com/2013/05/23/logitech-wired-ipad-keyboard/")
Summary.create(user_id: 38, article_url: "https://cn.engadget.com/2019/12/05/nasa-parker-solar-probe-results/")

puts "Database successfully created!"
