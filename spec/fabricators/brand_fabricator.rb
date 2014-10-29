Fabricator(:brand) do
  name {Faker::Lorem.words(1).first}
  description { Faker::Lorem.paragraph}
  logo {Faker::Avatar.image}
end