class MentorCoursesController < ApplicationController
  def index
    if current_user.role === "mentor"
      render ({
        json: { 
          user: current_user,
          mentor_data: current_user.mentor,
          courses: current_user.mentor.courses 
        }, 
        status: 200
      })
    else
      render json: { error: "Not Found" }, status: 404
    end
  end

  def show
    if current_user.role === "mentor"
      render ({
        json: { 
          course: current_user.mentor.courses.find(params[:course_id]) 
        }, 
        status: 200
      })
    else
      render json: { error: "Not Found" }, status: 404
    end
  end

  def create
    if current_user.role == "mentor"
      if (current_user.mentor.courses.filter { |c| c.id == params[:course_id] }).length == 0 
        mentor_course = MentorCourse.new(
          mentor_id: current_user.mentor.id,
          course_id: params[:course_id]
        )
        if mentor_course.save
          render ({
            json: { 
              message: "Course added to mentor",
              course: mentor_course 
            }, 
            status: 201
          })
        else
          render json: { error: "Unprocessable Entity" }, status: 422
        end
      else
        render json: { error: "Mentor already has that course." }, status: 422
      end
    else
      render json: { error: "Not Found" }, status: 404
    end
  end

  def destroy
    if current_user.role === "mentor"
      mentor_course = MentorCourse.find_by(
        mentor_id: current_user.mentor.id, 
        course_id: params[:course_id]
      )
      
      if mentor_course.destroy
        render ({
          json: {
            message: "Course deleted in mentor",
            course: mentor_course
          }, 
          status: 200
        })
      else
        render json: { error: "Unable to destroy course in mentor" }, status: 422
      end
    else
      render json: { error: "Not Found" }, status: 404
    end
  end

end
