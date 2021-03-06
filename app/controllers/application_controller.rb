class ApplicationController < ActionController::API
    include Response
    include ExceptionHandler

    # called before every action on controllers
  # before_action :authorize_request
  before_action :authorize_user
  attr_reader :current_user

  private

  def authorize_user
    # Check for valid cookie stored jwt token
    token = request.headers[:Authorization]
    # Return user with AuthorizeApiRequest Module
    if token
      @current_user = (AuthorizeApiRequest.new(token).call)[:user]
    else
      raise(ExceptionHandler::AuthenticationError, Message.unauthorized)
    end
  end
end
