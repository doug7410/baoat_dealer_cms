Fabricator(:upgrade_option) do 
  name {Faker::Lorem.words(1).first}
  price_in_cents 20000
  cost_in_cents 15000
end