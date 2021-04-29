class Cohort < ApplicationRecord
  has_many :cohort_courses
  has_many :courses, through: :cohort_courses
  has_many :student_cohorts
  has_many :students, through: :student_cohorts

  validates_presence_of :name,
    :on => :create

  validates_length_of :name, :description,
    :minimum => 2,
    :allow_nil => true

  # validate :val_start_date, :on => :update
  
  private

    def val_start_date
      if !self.start_date then errors.add(:start_date, "date input is not valid") end
    end

  
end
