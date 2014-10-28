Fabricator(:motor) do
  name {Faker::Lorem.words(1).first}
  hp "50"
  shaft 25
  motor_type "ETEC"
end