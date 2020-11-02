class UnitLessonsController < ApplicationController
  def create
    if set_unit_lesson == nil
      if set_unit && set_lesson
        set_unit.lessons << set_lesson

        render json: {
          message: "Relationship created successfully",
          relationship: set_unit_lesson,
          unit: set_unit,
          lesson: set_lesson
        },
        status: 200
      else
        render json: {
          message: "Not found"
        }  
        status: 404
      end
    else
      render json: {
        message: "Relationship already exist"
      }
      status: 412
    end
  end

  def destroy
    if set_unit_lesson && set_unit_lesson.destroy
      render json: 
      {
        message: "Relationship deleted successfully",
        unit: set_unit,
        lesson: set_lesson
      },
      status: 200
    else
      render json: {
        message: "Relationship doesn't exist"
      },
      status: 404
    end
  end

  private

    def set_unit
      Unit.find(params[:unit_id])
    end

    def set_lesson
      Lesson.find(params[:lesson_id])
    end

    def set_unit_lesson
      UnitLesson.find_by(unit_id: params[:unit_id], lesson_id: params[:lesson_id])
    end
end