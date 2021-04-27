require 'faker'
FactoryBot.define do
  factory :lesson do |f|
    f.name  { "Ruby on Rails"}
    f.description { "Backend" }
    # f.created_at { "2016-11-11 13:30:31 UTC" }
    # f.updated_at { "2016-11-11 13:30:31 UTC"  }
    f.created_at { Faker::Lorem.created_at } 
    f.updated_at { Faker::Lorem.updated_at }

  end
end
