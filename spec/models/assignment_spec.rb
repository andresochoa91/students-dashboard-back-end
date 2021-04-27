require 'rails_helper'

RSpec.describe Assignment, type: :model do
  describe "Associations" do
    it { should have_many(:student_assignments) }
    it { should have_many(:lesson_assignments) }
    it { should have_many(:lessons).through(:lesson_assignments) }
  end
  describe "Validations" do
    it { should validate_presence_of(:lesson) }
    it { should validate_length_of(:description).is_at_least(2) }
  end
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
end
