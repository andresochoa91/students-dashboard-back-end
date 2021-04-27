require 'rails_helper'
RSpec.describe Cohort, type: :model do
  subject { Cohort.new(name: "John", description: "description", start_date: DateTime.now + 1.week )}   
    describe "Associations" do
      it { should have_many(:cohort_courses) }
      it { should have_many(:courses).through(:cohort_courses) }
    end
    it "is valid with valid attributes" do
        expect(subject).to be_valid
    end
    it "is not valid without a name" do
        subject.name=nil
        expect(subject).to_not be_valid
    end
    it "is not valid without a name" do
        subject.name=nil
        expect(subject).to_not be_valid
    end
    it "is not valid if the description is min 2 chars" do
      description = subject.description.length
      if description <2
        expect(subject). to_not be_valid
      end
    end
    it "is not valid if the name is min 2 chars" do
      name = subject.name.length
      if name <2
        expect(subject). to_not be_valid
      end
    end
end

  #pending "add some examples to (or delete) #{__FILE__}"\
#   has_many :cohort_courses
#   has_many :courses, through: :cohort_courses

#   validates_presence_of :name,
#     :on => :create

#   validates_length_of :name, :description,
#     :minimum => 2,
#     :allow_nil => true,
#     :allow_blank => true

#   # validate :val_start_date, :on => :update
  
#   private

#     def val_start_date
#       if !self.start_date then errors.add(:start_date, "date input is not valid") end
#     end

# require 'rails_helper'

# RSpec.describe Category, type: :model do

#   describe "Validations" do
#     it { should validate_presence_of(:name) }
#     it { should validate_length_of(:name).is_at_least(3) }
#     it { should validate_length_of(:name).is_at_most(50) }
#     it { should validate_uniqueness_of(:name) }
#   end

#   describe "Associations" do
#     it { should have_many(:agency_categories) }
#     it { should have_many(:agencies).through(:agency_categories) }
#   end
# end

  
            # RSpec.describe User, :type => :model do
            #   context 'associations' do
            #    it "should have many projects" do
            #      subject { described_class.new }
            #      assc = described_class.reflect_on_association(:projects)
            #      expect(assc.macro).to eq :has_many
            #    end
            #  end
            # end

    # describe "Cohort" do
    #   # it { should have_many(:cohort_courses) }
    #   it "should have_many cohort_courses" do
    #     subject { described_class.new }
    #     ass = described.class.reflect_on_association(:cohort_courses)
    #     expect (assc.macro).to eq :has_many
    #   end #(:cohort_courses) }
    #   it { should have_many(:courses).through(:cohort_courses) }
    # end



    # describe 'validations' do
    #   it { should validate_presence_of(:name) }
    #   it { should validate_length_of(:name).is_at_least(2) }
    #   it { is_expected.to allow_value(nil).for(:name) }
    # end

