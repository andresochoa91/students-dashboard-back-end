class Lesson < ApplicationRecord
  has_many :lesson_materials
  has_many :materials, through: :lesson_materials
  has_many :unit_lessons
  has_many :units, through: :unit_lessons
  has_many :lesson_assignments
  has_many :assignments, through: :lesson_assignments
  # belongs_to :cohort
  
  validates_presence_of :name, :on => :create

  validates_length_of :name, 
    :minimum => 2,
    :allow_nil => true
    
  # has_many :sources
  # has_many :unit_lessons
  # has_many :units, through: :unit_lessons
  # has_many :lesson_sources
  # has_many :sources, through: :lesson_sources
  # has_one :assignment
  # has_many :weeks
  
  # validates_presence_of :lesson_name, :on => :create

  # validates_length_of :lesson_name, 
  #   :minimum => 2,
  #   :allow_nil => true

end
