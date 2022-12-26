FactoryBot.define do
  factory :person do
    name { Faker::Name.name }
    times { Random.rand(5000) }
  end
end
