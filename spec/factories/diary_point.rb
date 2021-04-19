FactoryBot.define do
  factory :diary_point do
    title { Faker::Lorem }
    text { Faker::Lorem }
  end
end
