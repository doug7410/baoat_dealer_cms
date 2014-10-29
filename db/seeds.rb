# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: "user@email.com", password: "password", password_confirmation: "password")

carolina_skiff = Brand.create(name: "Carolina Skiff", logo: "carolina_skiff_logo.jpg", description: "A great skiff company!")
evinrude = Brand.create(name: "Evinrude", logo: "evinrude_logo.jpg", description: "A great motor company!")
mercury = Brand.create(name: "Mercury", logo: "mercury_logo.jpg", description: "A great motor company!")

jvx16 = Boat.create(brand: carolina_skiff, name: "JVX16", year: "2014", price_in_cents: 554000, message: "here is some message")

motor1 = Motor.create(name: "50DPX", hp: "60", shaft: 25, motor_type: "ETEC", brand: evinrude)
motor2 = Motor.create(name: "60DPX", hp: "70", shaft: 25, motor_type: "ETEC", brand: evinrude)
motor3 = Motor.create(name: "ME50", hp: "55", shaft: 25, motor_type: "4/S", brand: mercury)
motor4 = Motor.create(name: "ME60", hp: "65", shaft: 25, motor_type: "4/S", brand: mercury)

BoatMotorPackage.create(boat: jvx16, motor: motor1, price_in_cents: 999900, brand: evinrude)
BoatMotorPackage.create(boat: jvx16, motor: motor2, price_in_cents: 999900, brand: evinrude)
BoatMotorPackage.create(boat: jvx16, motor: motor3, price_in_cents: 999900, brand: mercury)
BoatMotorPackage.create(boat: jvx16, motor: motor4, price_in_cents: 999900, brand: mercury)

25.times do
  BoatStandardFeature.create(boat: jvx16, standard_feature: Fabricate(:standard_feature))
end

15.times do
  BoatUpgradeOption.create(boat: jvx16, upgrade_option: Fabricate(:upgrade_option))
end