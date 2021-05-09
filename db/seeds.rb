# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "管理者",
name_kana: "カンリシャ",
postcode: "2700138",
email: "nebel.hb@gmail.com",
password: "1111800018",

password_confirmation: "1111800018",
admin: true)