FactoryBot.define do
  factory :car do
    name { Faker::Car.name }
    description { Faker::Car.description }
    photo { Faker::Car.photo }
    price { Faker::Car.price }
    model { Faker::Car.model }
    user { create(:user) }
  end
end
