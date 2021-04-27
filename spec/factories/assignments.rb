require 'faker'
FactoryBot.define do
  factory :assignments do
    # link: "https://classroom.github.com/assignment-invitations/787bc76b33eea8f5f81928d26991c552/status",
    # # lesson_id: 13
    # tlessons: [
    #   Tlesson.find(13)
    name  { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    lesson { Faker::Lorem.lesson }
    lesson_id { Faker::Lorem.lesson_id }
  end
end