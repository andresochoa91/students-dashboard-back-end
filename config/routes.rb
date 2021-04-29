Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  #User authentication
  devise_for :users,
  controllers: {
    registrations: :registrations,
    sessions: :sessions
  }

  devise_scope :user do
    get 'create_github' => "sessions#create_github"
  end


  # resources :mentors
  resources :students
  resources :staffs

  resources :cohorts
  post 'cohorts/:cohort_id/clone_course/:tcourse_id', to: 'cohorts#clone_course'
  resources :courses
  post 'courses/:course_id/clone_unit/:tunit_id', to: 'courses#clone_unit'
  resources :units
  post 'units/:unit_id/clone_lesson/:tlesson_id', to: 'units#clone_lesson'
  resources :lessons
  post 'lessons/:lesson_id/clone_material/:tmaterial_id', to: 'lessons#clone_material'
  post 'lessons/:lesson_id/clone_assignment/:tassignment_id', to: 'lessons#clone_assignment'
  resources :materials
  resources :assignments

  #Resources Templates
  resources :tcourses
  resources :tunits
  resources :tlessons
  resources :tmaterials
  resources :tassignments

  #User information
  resources :users
  get 'user', to: 'users#show_current_user'

  #Templates relationships generators
  get '/tcourses_tunits', to: 'tcourse_tunits#index'
  get '/tcourses/:tcourse_id/tunits/:tunit_id', to: 'tcourse_tunits#show'
  post '/tcourses/:tcourse_id/tunits/:tunit_id', to: 'tcourse_tunits#create'
  delete '/tcourses/:tcourse_id/tunits/:tunit_id', to: 'tcourse_tunits#destroy'

  get '/tunits_tlessons', to: 'tunit_tlessons#index'
  get '/tunits/:tunit_id/tlessons/:tlesson_id', to: 'tunit_tlessons#show'
  post '/tunits/:tunit_id/tlessons/:tlesson_id', to: 'tunit_tlessons#create'
  delete '/tunits/:tunit_id/tlessons/:tlesson_id', to: 'tunit_tlessons#destroy'

  get '/tlessons_tmaterials', to: 'tlesson_tmaterials#index'
  get '/tlessons/:tlesson_id/tmaterials/:tmaterial_id', to: 'tlesson_tmaterials#show'
  post '/tlessons/:tlesson_id/tmaterials/:tmaterial_id', to: 'tlesson_tmaterials#create'
  delete '/tlessons/:tlesson_id/tmaterials/:tmaterial_id', to: 'tlesson_tmaterials#destroy'

  get '/tlessons_tassignments', to: 'tlesson_tassignments#index'
  get '/tlessons/:tlesson_id/tassignments/:tassignment_id', to: 'tlesson_tassignments#show'
  post '/tlessons/:tlesson_id/tassignments/:tassignment_id', to: 'tlesson_tassignments#create'
  delete '/tlessons/:tlesson_id/tassignments/:tassignment_id', to: 'tlesson_tassignments#destroy'

  get 'student_assignment/students_tracking', to: 'student_assignment#students_tracking'
  get 'student_assignment/:student_id', to: 'student_assignment#index'
  get 'student_assignment/:student_id/student_tracking', to: 'student_assignment#student_tracking'
  get 'student_assignment/:student_id/assignment/:assignment_id', to: 'student_assignment#show'
  patch 'student_assignment/:student_id/assignment/:assignment_id', to: 'student_assignment#update'

  get 'student_material/students_tracking', to: 'student_material#students_tracking'
  get 'student_material/:student_id', to: 'student_material#index'
  get 'student_material/:student_id/student_tracking', to: 'student_material#student_tracking'
  get 'student_material/:student_id/material/:material_id', to: 'student_material#show'
  patch 'student_material/:student_id/material/:material_id', to: 'student_material#update'

  # add material to lesson and destroy material from lesson
  post 'lesson/:lesson_id/material/:material_id', to: 'lesson_material#create'
  delete 'lesson/:lesson_id/material/:material_id', to: 'lesson_material#destroy'

  # add assignment to lesson and destroy assignment from lesson
  post 'lesson/:lesson_id/assignment/:assignment_id', to: 'lesson_assignment#create'
  delete 'lesson/:lesson_id/assignment/:assignment_id', to: 'lesson_assignment#destroy'

  # add assignment to lesson
  post 'lesson/:id/assignment/:assignment_id', to: 'lessons#add_assignment'

  
  post '/cohorts/:cohort_id/courses/:course_id', to: 'cohort_courses#create'
  delete '/cohorts/:cohort_id/courses/:course_id', to: 'cohort_courses#destroy'

  post '/courses/:course_id/units/:unit_id', to: 'course_units#create'
  delete '/courses/:course_id/units/:unit_id', to: 'course_units#destroy'

  post '/units/:unit_id/lessons/:lesson_id', to: 'unit_lessons#create'
  delete '/units/:unit_id/lessons/:lesson_id', to: 'unit_lessons#destroy'

  # student_cohort association routes
  get '/student_cohorts', to: 'student_cohort#index'
  get '/student/:student_id/cohort/:cohort_id', to: 'student_cohort#show'
  # add student to cohort and destroy student from cohort
  post 'student/:student_id/cohort/:cohort_id', to: 'student_cohort#create'
  delete 'student/:student_id/cohort/:cohort_id', to: 'student_cohort#destroy'

  # post '/lessons/:lesson_id/sources/:source_id', to: 'lesson_sources#create'
  # delete '/lessons/:lesson_id/sources/:source_id', to: 'lesson_sources#destroy'
  # get '/course_units', to: 'course_units#index'
  # get '/courses', to: 'courses#index'
  
  # get '/courses/search', to: 'courses#search'
  # get '/units/search', to: 'units#search'
  # get '/lessons/search', to: 'lessons#search'
  # get '/sources/search', to: 'sources#search'

  # get '/assignments', to: 'assignments#index'

  # get '/courses/:course_id/units/:unit_id/lessons/:lesson_id/week', to: 'weeks#show'
  # post '/courses/:course_id/units/:unit_id/lessons/:lesson_id/week', to: 'weeks#create'
  # put '/courses/:course_id/units/:unit_id/lessons/:lesson_id/week', to: 'weeks#update'
  # delete '/courses/:course_id/units/:unit_id/lessons/:lesson_id/week', to: 'weeks#destroy'

  # get '/courses/:course_id/units/:unit_id/lessons/:lesson_id/assignment', to: 'assignments#show'
  # get '/units/:unit_id/lessons/:lesson_id/assignment', to: 'assignments#show'
  # get '/lessons/:lesson_id/assignment', to: 'assignments#show'
  # post '/courses/:course_id/units/:unit_id/lessons/:lesson_id/assignment', to: 'assignments#create'
  # post '/units/:unit_id/lessons/:lesson_id/assignment', to: 'assignments#create'
  # post '/lessons/:lesson_id/assignment', to: 'assignments#create'
  # put '/courses/:course_id/units/:unit_id/lessons/:lesson_id/assignment', to: 'assignments#update'
  # put '/units/:unit_id/lessons/:lesson_id/assignment', to: 'assignments#update'
  # put '/lessons/:lesson_id/assignment', to: 'assignments#update'
  # delete '/courses/:course_id/units/:unit_id/lessons/:lesson_id/assignment', to: 'assignments#destroy'
  # delete '/units/:unit_id/lessons/:lesson_id/assignment', to: 'assignments#destroy'
  # delete '/lessons/:lesson_id/assignment', to: 'assignments#destroy'

  # get 'mentor_courses', to: 'mentor_courses#index'
  # get 'mentor_courses/:course_id', to: 'mentor_courses#show'
  # post 'mentor_courses', to: 'mentor_courses#create'
  # delete 'mentor_courses/:course_id', to: 'mentor_courses#destroy'

  # get 'students', to: 'students#index'
  # get 'students/:user_id', to: 'students#show'
  # post 'students', to: 'students#create'
  # put 'students', to: 'students#update'
  # put 'students/staff_update', to: 'students#staff_update'

  # get 'student_courses', to: 'student_course#index'
  # get 'student_courses/student/:student_id', to: 'student_course#find_student'
  # post 'student_courses/create', to: 'student_course#create'
  # post 'student_courses/create_student_and_course', to: 'student_course#create_student_and_course'
  # patch 'student_courses/:student_id/update', to: 'student_course#update'
  # get 'student_courses/:course_id', to: 'student_course#show'

  # get 'student_weekly_progress/students_tracking', to: 'student_weekly_progress#students_tracking'
  # get 'student_weekly_progress/:student_id', to: 'student_weekly_progress#index'
  # get 'student_weekly_progress/:student_id/student_tracking', to: 'student_weekly_progress#student_tracking'
  # get 'student_weekly_progress/:student_id/week_number/:week_number', to: 'student_weekly_progress#show'
  # patch 'student_weekly_progress/:student_id/week_number/:week_number', to: 'student_weekly_progress#update'

  # get 'registered_mentor_sessions/:student_id', to: 'registered_mentor_sessions#index'
  # get 'registered_mentor_sessions/:student_id/week_number/:week_number', to: 'registered_mentor_sessions#show'
  # post 'registered_mentor_sessions/:student_id', to: 'registered_mentor_sessions#create'
  # patch 'registered_mentor_sessions/:registered_mentor_session_id', to: 'registered_mentor_sessions#update'
  # delete 'registered_mentor_sessions/:registered_mentor_session_id', to: 'registered_mentor_sessions#destroy'


end
