class Source < ApplicationRecord
  has_many :lessons_sources
  has_many :lessons, through: :lessons_sources
end
