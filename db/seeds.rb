# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


Employee.destroy_all




Employee.create!(
  [
    {
      first_name: "haya",
      father_name: "ahmad",
      grandfather_name: "fayez",
      family_name: "aljomaa",
      ar_first_name: "هيا",
      ar_father_name: "احمد",
      ar_grandfather_name: "فايز",
      ar_family_name: "الجمعه",
      nid: Faker::Number.number(digits: 10),
      email: Faker::Internet.email,
      phone_number: Faker::PhoneNumber.phone_number,
      e_phone_number: Faker::PhoneNumber.phone_number,
      national: true
    },
    {
      first_name: "fedaa",
      father_name: "salem",
      grandfather_name: "soboh",
      family_name: "jabrawi",
      ar_first_name: "فداء",
      ar_father_name: "سالم",
      ar_grandfather_name: "صبح",
      ar_family_name: "جبراوي",
      nid: Faker::Number.number(digits: 10),
      email: Faker::Internet.email,
      phone_number: Faker::PhoneNumber.phone_number,
      e_phone_number: Faker::PhoneNumber.phone_number,
      national: true
    },
    {
      first_name: "yamen",
      father_name: "mahmoud",
      grandfather_name: "ahmad",
      family_name: "hijar",
      ar_first_name: "يامن",
      ar_father_name: "محمود",
      ar_grandfather_name: "احمد",
      ar_family_name: "هيجر",
      nid: Faker::Number.number(digits: 10),
      email: Faker::Internet.email,
      phone_number: Faker::PhoneNumber.phone_number,
      e_phone_number: Faker::PhoneNumber.phone_number,
      national: true
    },
    {
      first_name: "sohad",
      father_name: "salem",
      grandfather_name: "deeb",
      family_name: "abdalfatah",
      ar_first_name: "سهاد",
      ar_father_name: "سليم",
      ar_grandfather_name: "ذيب",
      ar_family_name: "عبد الفتاح",
      nid: Faker::Number.number(digits: 10),
      email: Faker::Internet.email,
      phone_number: Faker::PhoneNumber.phone_number,
      e_phone_number: Faker::PhoneNumber.phone_number,
      national: true
    }
  ]
)
