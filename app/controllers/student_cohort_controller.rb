class StudentCohortController < ApplicationController
  skip_before_action :authenticate_cookie 
  before_action :set_student, only: [:create, :destroy]
  before_action :set_cohort, only: [:create, :destroy]
  before_action :set_student_cohort, only: [:show, :create, :destroy]
  before_action :set_student_cohorts, only: [:create, :destroy]

  def index
    @student_cohorts = StudentCohort.all
    render json: @student_cohorts, include: ['student', 'cohort']
  end

  def show
    if @student_cohort.blank?
      render json: {message: "Relationship doesn't exist"}, status: 404
    else
      render json: @student_cohort, include: ['student', 'cohort']
    end
  end

  def create
    if @student_cohort == nil
      if @student && @cohort
        @student.cohort << @cohort

        render json: {
          message: "Relationship created successfully",
          relationship: @student_cohort,
          student: @student,
          cohort: @cohort
        }
      else
        render json: { message: "Not found" }, status: 404  
      end
    else
      render json: { message: "Relationship already exist" }, status: 412
    end
  end

  def destroy
    if @student_cohort && @student_cohort.destroy

      render json: {
        message: "Relationship deleted successfully",
        student: @student,
        cohort: @cohort
      }
    else
      render json: { message: "Relationship doesn't exist" }, status: 404
    end
  end

  private

  def set_student
      @student = Student.find(params[:student_id])
  end

  def set_cohort
      @cohort = Cohort.find(params[:cohort_id])
  end

  def set_student_cohort
      @student_cohort = StudentCohort.find_by(student_id: params[:student_id], cohort_id: params[:cohort_id])
  end

  def set_student_cohorts
      @student_cohorts = StudentCohort.where(cohort_id: params[:cohort_id]).order("id ASC")
  end
end
