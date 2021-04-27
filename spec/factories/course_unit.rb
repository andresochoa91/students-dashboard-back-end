require 'faker'
FactoryBot.define do
  factory :course_unit do |f|
    f.course_id { Faker::Id.course_id }
    f.unit_id { Faker::Id.unit_id }
  end
end
