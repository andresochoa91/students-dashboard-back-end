class CoursesController < ApplicationController
  def index
    @courses = Course.all
    render json: {
      status: 200,
      message: "Success",
      courses: @courses
    }
  end

  def search
    @courses = params[:course_name] ? 
      Course.where("course_name ILIKE ?", "%#{params[:course_name]}%") :
      params[:description] ?
        Course.where("description ILIKE ?", "%#{params[:description]}%") :
        []

    render json: {
      message: "Success",
      courses: @courses
    },
    status: 200
  end

  def show
    if set_course
    # && @user 
      render json: {
        message: "Success",
        course: set_course
      },
      status: 200
    else
      error_json
    end
  end

  def create
    @course = Course.create(course_params)
    if @course
    # && @user && @user.role == "staff"
      render json: {
        message: "Course created",
        course: @course
      },
      status: 201
    else
      error_json
    end
  end

  def update
    if set_course.update(course_params)
    # && @user && @user.role == "staff"
      render json: {
        message: "Course updated",
        course: set_course
      },
      status: 200
    else
      error_json
    end
  end

  def destroy
    if set_course.destroy
    # && @user && @user.role == "staff"
      render json: {
        message: "Course deleted",
      },
      status: 200
    else
      error_json
    end
  end

  private

    def course_params
      params.require(:course).permit(:course_name, :description)
    end

    def set_course
      Course.find(params[:id])
    end

    def error_json
      render json: {
        message: "Error"
      },
      status: 401
    end
end
