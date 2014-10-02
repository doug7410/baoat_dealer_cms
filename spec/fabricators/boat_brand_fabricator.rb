Fabricator(:boat_brand) do
  name {Faker::Lorem.words(1).first}
  logo { Faker::Lorem.words(1).first}
  description { Faker::Lorem.paragraph}
end