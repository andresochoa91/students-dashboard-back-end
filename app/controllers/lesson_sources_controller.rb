class LessonSourcesController < ApplicationController
  def create
    if set_lesson_source == nil
      if set_lesson && set_source
        set_lesson.sources << set_source

        render json: {
          message: "Relationship created successfully",
          relationship: set_lesson_source,
          lesson: set_lesson,
          source: set_source
        },
        status: 200
      else
        render json: {
          message: "Not found"
        },
        status: 404
      end
    else
      render json: {
        message: "Relationship already exist"      
      },
      status: 412 
    end
  end

  def destroy
    if set_lesson_source && set_lesson_source.destroy
      render json: {
        message: "Relationship deleted successfully",
        lesson: set_lesson,
        source: set_source
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

    def set_lesson
      Lesson.find(params[:lesson_id])
    end

    def set_source
      Source.find(params[:source_id])
    end

    def set_lesson_source
      LessonSource.find_by(lesson_id: params[:lesson_id], source_id: params[:source_id])
    end
end