# app/controllers/authentication_controller.rb
class SessionsController < Devise::SessionsController
  # skip_before_action :authorize_user, only: :create
  # return auth token once user is authenticated
  def create
    auth_token = AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    user = User.find_by(email: auth_params[:email])
    # HTTP-only cookie stored with refresh_token
    # Note - May be needed before launching production:  SameSite: "Strict"
    response.set_header('Authorization', auth_token)
    json_response(user, :ok, user_options)
    # render json: user, include: user_options
    # json_response(message: "Successfully authenticated." , user_role: user.role,user_id: user.id)
  end

  private

  def auth_params
    params.permit(:email, :password, authentication: [:email, :password])
    # params.permit(:email, :password)
  end

  def user_options
    ['user', 'student', 'staff', 'student.student_course.course', 'student.student_weekly_progresses.registered_mentor_sessions', 'student.student_weekly_progresses.week', 'student.student_weekly_progresses.registered_mentor_sessions.mentor_course', 'student.student_weekly_progresses.registered_mentor_sessions.mentor_course.mentor', 'student.student_weekly_progresses.registered_mentor_sessions.mentor_course.mentor.user', 'student.student_weekly_progresses.week.course', 'student.student_weekly_progresses.week.unit', 'student.student_weekly_progresses.week.lesson']
  end
end