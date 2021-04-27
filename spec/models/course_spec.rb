require 'rails_helper'

RSpec.describe Course, type: :model do
  subject { Course.new(name: "Ruby on Rails", description: "Ruby on Rails")}
    describe "Associations" do
      it { should have_many(:cohort_courses) }
      it { should have_many(:cohorts).through(:cohort_courses) }
      it { should have_many(:course_units) }
      it { should have_many(:units).through(:course_units) }
    end
   
    describe "Validations" do
      it { should validate_presence_of(:name) }
      it { should validate_length_of(:name).is_at_least(2) }
      it { should validate_length_of(:description).is_at_least(2) }
    end

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    it "is not valid without a name" do
      subject.name=nil
      expect(subject).to_not be_valid
    end
    it "is not valid if the name is not min 2 chars" do
      name = subject.name.length
      if name <2
        expect(subject). to_not be_valid
      end
    end
    it "is not valid if the description is not min 2 chars" do
      description = subject.description.length
      if description <2
        expect(subject). to_not be_valid
      end
    end
end
# describe 'validations' do
    #   it { should validate_presence_of(:name) }
    #   it { should validate_length_of(:name).is_at_least(2) }
    #   it { is_expected.to allow_value(nil).for(:name) }
# end

#   has_many :cohort_courses
#   has_many :cohorts, through: :cohort_courses
#   has_many :course_units
#   has_many :units, through: :course_units
#   has_many :weeks
#   has_many :mentor_courses
#   has_many :mentors, through: :mentor_courses
  
#   validates_presence_of :name,
#     :on => :create

#   validates_length_of :name, :description,
#     :minimum => 2,
#     :allow_nil => true,
#     :allow_blank => true
