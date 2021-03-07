class RegistrationsController < Devise::RegistrationsController
  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    # HTTP-only cookie stored with refresh_token
    
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
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
end