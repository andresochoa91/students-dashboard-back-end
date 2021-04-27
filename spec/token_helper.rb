module TokenHelper
  def auth_token(user)
    return CoreModules::JsonWebToken.encode({
    user_id: user.id
    }, 24.hours.from_now)
  end    
end 