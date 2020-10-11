class Lesson < ApplicationRecord
  has_many :lessons_sources
  has_many :sources, through: :lessons_sources
end
