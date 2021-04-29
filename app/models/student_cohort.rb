class StudentCohort < ApplicationRecord
  belongs_to :student
  belongs_to :cohort

  validates_presence_of :student, :cohort
end
