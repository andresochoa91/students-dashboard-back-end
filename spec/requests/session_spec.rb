require 'rails_helper'
RSpec.describe SessionsController, type: :request do  
    let!(:user) { FactoryBot.create(:user) }
    it 'logs the user in' do
      post "/users/sign_in", params: {user: {email: user.email, password: "Pa$$word"}}
      #byebug
      expect(response).to have_http_status(200)
    end 
end
