# app/controllers/users_controller.rb
class UsersController < ApplicationController
  skip_before_action :authorize_user, only: [:create]
  # POST /signup
  # return authenticated token upon signup
  # def create
  #   user = User.create!(user_params)
  #   auth_token = AuthenticateUser.new(user.email, user.password).call
  #   # HTTP-only cookie stored with refresh_token
    
  #   response = { message: Message.account_created, auth_token: auth_token }
  #   json_response(response, :created)
  # end
  
  # GET /users
  def index
    @users = User.all
    json_response(@users)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      json_response(message: Message.account_updated)
    else
      json_response(message: "could not update.")
    end
  end

  def show_current_user
    # token = params[:token]
    # decoded_token = JsonWebToken.decode(token)

    # if decoded_token
    #   user = User.find_by(id: decoded_token[:user_id])
    #   json_response(user, :ok, user_options)
    # end
      json_response(@current_user, :ok, user_options)
  end

  private

  def user_params
    params.require(:user).permit(
      :username,
      :email,
      :role,
      :password,
      :password_confirmation
    )
  end

  def user_options
    ['user', 'student', 'staff', 'student.student_course.course', 'student.student_weekly_progresses.registered_mentor_sessions', 'student.student_weekly_progresses.week', 'student.student_weekly_progresses.registered_mentor_sessions.mentor_course', 'student.student_weekly_progresses.registered_mentor_sessions.mentor_course.mentor', 'student.student_weekly_progresses.registered_mentor_sessions.mentor_course.mentor.user', 'student.student_weekly_progresses.week.course', 'student.student_weekly_progresses.week.unit', 'student.student_weekly_progresses.week.lesson']
  end
end
