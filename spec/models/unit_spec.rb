require 'rails_helper'

RSpec.describe Unit, type: :model do
  # has_many :course_units
  # has_many :courses, through: :course_units
  # has_many :unit_lessons
  # has_many :lessons, through: :unit_lessons
  # has_many :weeks

  # validates_presence_of :name, 
  #   :on => :create

  # validates_length_of :name, :description, :duration,
  #   :minimum => 2,
  #   :allow_nil => true,
  #   :allow_blank => true
  subject { Unit.new(name: "Battleship", description: "game", duration:"one week")}
    describe "Associations" do
      it { should have_many(:course_units) }
      it { should have_many(:courses).through(:course_units) }
      it { should have_many(:unit_lessons) }
      it { should have_many(:lessons).through(:unit_lessons) }
    end
    
    describe "Validations" do
      it { should validate_presence_of(:name) }
      it { should validate_length_of(:name).is_at_least(2) }
      it { should validate_length_of(:description).is_at_least(2) }
      it { should validate_length_of(:duration).is_at_least(2) }
    end

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    it "is not valid without a name" do
      subject.name=nil
      expect(subject).to_not be_valid
    end

end
