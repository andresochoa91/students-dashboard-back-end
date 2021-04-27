require 'faker'
FactoryBot.define do
  factory :cohort do
    name  { Faker::Lorem.name }
    description { Faker::Lorem.description }
  end
end