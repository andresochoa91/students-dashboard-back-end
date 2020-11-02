class LessonsController < ApplicationController
  def index
    @lessons = set_course_id && set_unit_id ?
      set_course_unit_lessons :
      set_unit_id ?
        set_unit_lessons :
        Lesson.all

    if set_course_id && set_unit_id
      render json: {
        message: "Success",
        lessons: @lessons,
        course: Course.find(set_course_id),
        unit: Unit.find(set_unit_id)
      },
      status: 200
    elsif set_unit_id
      render json: {
        message: "Success",
        lessons: @lessons,
        unit: Unit.find(set_unit_id)
      },
      status: 200
    else
      render json: {
        message: "Success",
        lessons: @lessons
      },
      status: 200
    end
  end

  def search
    @lessons = params[:lesson_name] ? 
      Lesson.where("lesson_name ILIKE ?", "%#{params[:lesson_name]}%") :
      []
        
    render json: {
      message: "Success",
      lessons: @lessons
    },
    status: 200
  end

  def show
    @lesson = set_course_id && set_unit_id && set_lesson ?
      set_course_unit_lessons.find(set_lesson_id) :
      set_unit_id && set_lesson ?
        set_unit_lessons.find(set_lesson_id) :
        set_lesson

    if @lesson
    # && @user 
      if set_course_id && set_unit_id
        render json: {
          message: "Success",
          lesson: @lesson,
          course: Course.find(set_course_id),
          unit: Unit.find(set_unit_id)
        },
        status: 200
      elsif set_unit_id
        render json: {
          message: "Success",
          lessons: @lesson,
          unit: Unit.find(set_unit_id)
        },  
        status: 200
      else
        render json: {
          message: "Success",
          lesson: @lesson
        },
        status: 200
      end
    else
      error_json
    end
  end

  def create
    @lesson = Lesson.create(lesson_params)

    if @lesson
    # && @user && @user.role == "staff"
      render json: {
        message: "Lesson created",
        lesson: @lesson
      },
      status: 200
    else
      error_json
    end
  end

  def update
    if set_lesson.update(lesson_params)
    # && @user && @user.role == "staff"
      render json: {
        message: "Lesson updated",
        lesson: set_lesson
      },
      status: 200
    else
      error_json
    end
  end

  def destroy
    if set_lesson.destroy
    # && @user && @user.role == "staff"
      render json: {
        message: "Lesson deleted",
      },
      status: 200
    else
      error_json
    end
  end

  private

    def lesson_params
      params.require(:lesson).permit(:lesson_name)
    end

    def set_course_id
      params[:course_id]
    end

    def set_unit_id
      params[:unit_id]
    end

    def set_lesson_id
      params[:id]
    end

    def set_lesson
      Lesson.find(set_lesson_id)
    end

    def set_unit_lessons
      Unit.find(set_unit_id).lessons
    end

    def set_course_unit_lessons
      Course.find(set_course_id).units.find(set_unit_id).lessons
    end

    def error_json
      render json: {
        message: "Error"
      },
      status: 401
    end

end
