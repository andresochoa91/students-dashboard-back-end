require 'rails_helper'
RSpec.describe CourseUnit, type: :model do
  # belongs_to :course
  # belongs_to :unit

  # validates_presence_of :course, :unit
  subject { CourseUnit.new(course_id: 1, unit_id: 10)}
    describe "Associations" do
      it { should belong_to(:course) }
      it { should belong_to(:unit) }
    end
    describe "Validations" do
      it { should validate_presence_of(:course) }
      it { should validate_presence_of(:unit) }
    end
    it "is not valid without a course" do
      subject.course=nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a unit" do
      subject.unit=nil
      expect(subject).to_not be_valid
    end

    # it "is valid with valid attributes" do
    #   byebug
    #   expect(subject).to be_valid
    #   byebug
    # end
end
