Fabricator(:boat_main_model) do
  name {Faker::Lorem.words(1).first}
  description { Faker::Lorem.paragraph }
  after_build do |boat_main_model| 
    boat_main_model.small_model_image = File.open("public/uploads/tmp/Lowe_Boats_logo.jpg", "w") 
    boat_main_model.large_model_image = File.open("public/uploads/tmp/Lowe_Boats_logo.jpg", "w") 
  end
end