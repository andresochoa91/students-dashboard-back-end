require 'faker'
FactoryBot.define do
  factory :user do |f|
    f.username { Faker::String.random(length: 10) }
    f.email { Faker::Internet.email }
    f.password { "Pa$$word" }
    # f.password { Faker::Types.rb_string(len: 10)}
    f.role { "staff" }
  end
end