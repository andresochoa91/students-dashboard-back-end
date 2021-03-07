Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    registrations: :registrations,
    sessions: :sessions
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :students
  resources :mentors
  resources :staffs

  # post 'auth/login', to: 'authentication#authenticate'
  # post 'signup', to: 'users#create'

  get 'users', to: 'users#index'
  get 'user', to: 'users#show_current_user'
  put 'users/:id', to: 'users#update'
  get 'logout', to: 'users#logout'

  get '/', to: 'home#index'
  post '/courses/:course_id/units/:unit_id', to: 'course_units#create'
  delete '/courses/:course_id/units/:unit_id', to: 'course_units#destroy'
  post '/units/:unit_id/lessons/:lesson_id', to: 'unit_lessons#create'
  delete '/units/:unit_id/lessons/:lesson_id', to: 'unit_lessons#destroy'
  post '/lessons/:lesson_id/sources/:source_id', to: 'lesson_sources#create'
  delete '/lessons/:lesson_id/sources/:source_id', to: 'lesson_sources#destroy'
  get '/course_units', to: 'course_units#index'
  get '/courses', to: 'courses#index'
  
  get '/courses/search', to: 'courses#search'
  get '/units/search', to: 'units#search'
  get '/lessons/search', to: 'lessons#search'
  get '/sources/search', to: 'sources#search'

  get '/assignments', to: 'assignments#index'

  get '/courses/:course_id/units/:unit_id/lessons/:lesson_id/week', to: 'weeks#show'
  post '/courses/:course_id/units/:unit_id/lessons/:lesson_id/week', to: 'weeks#create'
  put '/courses/:course_id/units/:unit_id/lessons/:lesson_id/week', to: 'weeks#update'
  delete '/courses/:course_id/units/:unit_id/lessons/:lesson_id/week', to: 'weeks#destroy'

  get '/courses/:course_id/units/:unit_id/lessons/:lesson_id/assignment', to: 'assignments#show'
  get '/units/:unit_id/lessons/:lesson_id/assignment', to: 'assignments#show'
  get '/lessons/:lesson_id/assignment', to: 'assignments#show'
  post '/courses/:course_id/units/:unit_id/lessons/:lesson_id/assignment', to: 'assignments#create'
  post '/units/:unit_id/lessons/:lesson_id/assignment', to: 'assignments#create'
  post '/lessons/:lesson_id/assignment', to: 'assignments#create'
  put '/courses/:course_id/units/:unit_id/lessons/:lesson_id/assignment', to: 'assignments#update'
  put '/units/:unit_id/lessons/:lesson_id/assignment', to: 'assignments#update'
  put '/lessons/:lesson_id/assignment', to: 'assignments#update'
  delete '/courses/:course_id/units/:unit_id/lessons/:lesson_id/assignment', to: 'assignments#destroy'
  delete '/units/:unit_id/lessons/:lesson_id/assignment', to: 'assignments#destroy'
  delete '/lessons/:lesson_id/assignment', to: 'assignments#destroy'

  get 'mentor_courses', to: 'mentor_courses#index'
  get 'mentor_courses/:course_id', to: 'mentor_courses#show'
  post 'mentor_courses', to: 'mentor_courses#create'
  delete 'mentor_courses/:course_id', to: 'mentor_courses#destroy'

  get 'students', to: 'students#index'
  get 'students/:user_id', to: 'students#show'
  post 'students', to: 'students#create'
  put 'students', to: 'students#update'
  put 'students/staff_update', to: 'students#staff_update'

  get 'student_courses', to: 'student_course#index'
  get 'student_courses/student/:student_id', to: 'student_course#find_student'
  post 'student_courses/create', to: 'student_course#create'
  post 'student_courses/create_student_and_course', to: 'student_course#create_student_and_course'
  patch 'student_courses/:student_id/update', to: 'student_course#update'
  get 'student_courses/:course_id', to: 'student_course#show'

  get 'student_weekly_progress/students_tracking', to: 'student_weekly_progress#students_tracking'
  get 'student_weekly_progress/:student_id', to: 'student_weekly_progress#index'
  get 'student_weekly_progress/:student_id/student_tracking', to: 'student_weekly_progress#student_tracking'
  get 'student_weekly_progress/:student_id/week_number/:week_number', to: 'student_weekly_progress#show'
  patch 'student_weekly_progress/:student_id/week_number/:week_number', to: 'student_weekly_progress#update'

  get 'registered_mentor_sessions/:student_id', to: 'registered_mentor_sessions#index'
  get 'registered_mentor_sessions/:student_id/week_number/:week_number', to: 'registered_mentor_sessions#show'
  post 'registered_mentor_sessions/:student_id', to: 'registered_mentor_sessions#create'
  patch 'registered_mentor_sessions/:registered_mentor_session_id', to: 'registered_mentor_sessions#update'
  delete 'registered_mentor_sessions/:registered_mentor_session_id', to: 'registered_mentor_sessions#destroy'

  resources :courses do
    resources :units, only: [:index, :show] do
      resources :lessons, only: [:index, :show] do
        resources :sources, only: [:index, :show]
        resources :assignments
      end
    end
    resources :weeks, only: [:index, :show]
  end
  
  resources :units do
    resources :lessons, only: [:index, :show] do
      resources :sources, only: [:index, :show]
    end
  end

  resources :lessons do
    resources :sources, only: [:index, :show]
  end

  resources :sources

end
