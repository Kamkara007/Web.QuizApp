Rails.application.routes.draw do
  
  
 
  ################## MATERIALS  ##########################
  get "materials", to:"materials#index"
  resources :materials, except:[:index]
  
  ################## LEVELS  ##########################
  get "new-level", to:"levels#new"
  resources :levels, except:[:new]
 

 ################## MINI PROGRAMS  ##########################
 get 'miniprograms', to:"miniprogram#index"

  devise_for :users

   ################## COURSES  ##########################
   get "new-course", to:"courses#new"

   resources :courses, except:[:new] do
    resources :essentials, shallow: true
    resources :quizzes, only:[:new, :create]
   end

   resources :quizzes, except:[:new, :create] do
    resources :questions
    resources :quiz_submissions, only:[:create, :show], as: "submissions"
   end
   
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
