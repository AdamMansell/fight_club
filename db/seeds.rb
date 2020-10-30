10.times do
  user = User.create(name: Faker::Name.name, age: Faker::Number.between(from: 28, to: 33), weight: Faker::Number.between(from: 115, to: 250), height: Faker::Number.between(from: 66, to: 73), type: "Muay Thai")
end