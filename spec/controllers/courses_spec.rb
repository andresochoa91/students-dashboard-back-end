# def update
#     if @course.update(course_params)
#       render json: { message: "Course updated", course: @course }, status: 200
#     else
#       error_json
#     end
#   end
# require 'rails_helper'

# RSpec.describe CoursesController, type: :controller do
    

#     describe "PATCH courses#update" do
#         it 'update courses with valid attributes' do
            
#             course_params = {
#             course_name: 'updcourse',
#             description: 'update course'},
#             headers: {Authorization: @token}, as: :json
#             # "Content-Type": "application/json" 
    
#           post '/api/v1/course', :params => course_params.to_json, :headers => { "Content-Type": "application/json"}
#           #post '/api/v1/course', :params => course_params.to_json, :headers => { Authorization: @token }
          
#           json = JSON.parse(response.body)
#           expect(response).to have_http_status(201)
#         end
#       end
# end 

    # before do
    #     request.accept = 'application/json'
    #     request.content_type = 'application/json' 
    # end

    # end



# courses = Course.create([
#     {
#       name: "Ruby on Rails",
#       description: "Front-End development with React.JS",
#       cohorts: [
#         Cohort.find(1)
#       ]
#     },



# test "should update course params" do
    # user = FactoryBot.create(:user)
    # allow(AuthorizeApiRequest).to receive(:call).and_return(user)
        #get :create, params: params, as: :json
    #     new_name = "new name"
    #     new_decription = "new description"
    #     patch api_v1_courses(@course),
    #     params: { course: {name: new_name, description: new_decription }},
    #     headers: {Authorization: @token}, as: :json
    #     assert_respponse :success
    #     json_response = JSON.parse(self.response.body)
    #     assert_equal new_name, json_response['data']['attributes']['name']
    #     assert_equal new_description, json_response['data']['attributes']['new_description']
    # end 