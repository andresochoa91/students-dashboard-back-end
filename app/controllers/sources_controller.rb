class SourcesController < ApplicationController

  # before_action :set_source, only: [:show, :update]

  def index
    # if @user

    @sources = set_course_id && set_unit_id && set_lesson_id ?
      set_course_unit_lesson_sources :
      set_unit_id && set_lesson_id ?
        set_unit_lesson_sources :
        set_lesson_id ?
          set_lesson_sources :
          Source.all

    # @sources = Source.all
    if set_course_id && set_unit_id && set_lesson_id
      render json: {
        message: "Success",
        sources: @sources,
        course: Course.find(set_course_id),
        unit: Unit.find(set_unit_id),
        lesson: Lesson.find(set_lesson_id),
      },
      status: 200
    elsif set_unit_id && set_lesson_id
      render json: {
        message: "Success",
        sources: @sources,
        unit: Unit.find(set_unit_id),
        lesson: Lesson.find(set_lesson_id),
      },
      status: 200
    elsif set_lesson_id
      render json: {
        message: "Success",
        sources: @sources,
        lesson: Lesson.find(set_lesson_id),
      },
      status: 200
    else
      render json: {
        message: "Success",
        sources: @sources
      },
      status: 200
    end

    # else
    #   render json: {
    #     status: :401,
    #     message: "Error"
    #   }
    # end
  end

  def search
    @sources = params[:source_title] ? 
      Source.where("source_title ILIKE ?", "%#{params[:source_title]}%") :
      params[:link] ?
        Source.where("link ILIKE ?", "%#{params[:link]}%") :
        []

    render json: {
      message: "Success",
      sources: @sources
    },
    status: 200
  end


  def show

    @source = set_course_id && set_unit_id && set_lesson_id && set_source ?
      set_course_unit_lesson_sources.find(set_source_id) :
      set_unit_id && set_lesson_id && set_source ?
        set_unit_lesson_sources.find(set_source_id) :
        set_lesson_id && set_source ?
          set_lesson_sources.find(set_source_id) :
          set_source

    if @source
    # && @user 
      if set_course_id && set_unit_id && set_lesson_id
        render json: {
          message: "Success",
          sources: @source,
          course: Course.find(set_course_id),
          unit: Unit.find(set_unit_id),
          lesson: Lesson.find(set_lesson_id),
        },
        status: 200
      elsif set_unit_id && set_lesson_id
        render json: {
          message: "Success",
          sources: @source,
          unit: Unit.find(set_unit_id),
          lesson: Lesson.find(set_lesson_id),
        },
        status: 200
      elsif set_lesson_id
        render json: {
          message: "Success",
          sources: @source,
          lesson: Lesson.find(set_lesson_id),
        },  
        status: 200
      else
        render json: {
          message: "Success",
          sources: @source
        },
        status: 200
      end
    else
      error_json
    end
  end

  def create
    @source = Source.create(source_params)
    if @source
    # && @user && @user.role == "staff"
      render json: {
        message: "Source created",
        source: @source
      },
      status: 200
    else
      error_json
    end
  end

  def update
    if set_source.update(source_params)
    # && @user && @user.role == "staff"
      render json: {
        message: "Source updated",
        source: set_source
      },
      status: 200
    else
      error_json
    end
  end

  def destroy
    if set_source.destroy
    # && @user && @user.role == "staff"
      render json: {
        message: "Source deleted",
      },
      status: 200
    else
      error_json
    end
  end

  private

    def source_params
      params.require(:source).permit(:source_title, :link, :lesson_id)
    end

    def set_course_id
      params[:course_id]
    end

    def set_unit_id
      params[:unit_id]
    end

    def set_lesson_id
      params[:lesson_id]
    end

    def set_source_id
      params[:id]
    end

    def set_source
      Source.find(set_source_id)
    end

    def set_lesson_sources
      Lesson.find(set_lesson_id).sources
    end
    
    def set_unit_lesson_sources
      Unit.find(set_unit_id).lessons.find(set_lesson_id).sources
    end
    
    def set_course_unit_lesson_sources
      Course.find(set_course_id).units.find(set_unit_id).lessons.find(set_lesson_id).sources
    end

    def error_json
      render json: {
        message: "Error"
      },
      status: 401
    end

end
