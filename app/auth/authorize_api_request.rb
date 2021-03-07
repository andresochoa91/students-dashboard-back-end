# app/auth/authorize_api_request.rb
class AuthorizeApiRequest
  
    def initialize(jwt = {})
      @jwt = jwt
    end
  
    # Service entry point - return valid user object
    def call
      {
        user: user
      }
    end
  
    private
  
    attr_reader :jwt
  
    def user
      # check if user is in the database
      # memoize user object
      @user ||= User.find(@decoded_auth_token) if decoded_auth_token
      # handle user not found
    rescue ActiveRecord::RecordNotFound => e
      # raise custom error
      raise(
        ExceptionHandler::InvalidToken,
        ("#{Message.invalid_token} #{e.message}")
      )
    end
  
    # decode authentication token
    def decoded_auth_token
    # byebug
    # jwt = cookies.signed[:jwt]
      return @decoded_auth_token ||= (JsonWebToken.decode(cookie_jwt))[:user_id]
      raise(ExceptionHandler::AuthenticationError, Message.unauthorized)
    end
  
    # check for token in `Authorization` header
    def cookie_jwt
      if jwt.present?
        return jwt
      end
        raise(ExceptionHandler::MissingToken, Message.missing_token)
    end
  end