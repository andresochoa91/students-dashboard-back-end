class Student < ApplicationRecord
  belongs_to :user
  has_many :student_weekly_progresses
  has_many :student_materials
  has_many :materials, through: :student_materials
  has_many :student_assignments
  has_many :assignments, through: :student_assignments, dependent: :delete_all
  has_one :student_course
  
  has_many :student_cohorts
  has_many :cohort, through: :student_cohorts
end
