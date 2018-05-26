Rails.application.routes.draw do


  

  # get 'profile/index'

  root 'profiles#show'

  devise_for :users

  resource :profile
  resources :performance_reviews, only:[:index, :show] do 
    member do 
      post :comment
    end
  end

  resources :contributions
  
  namespace :admin do 
  	root "employees#index"
  	resources :users
    resources :employees do 
      resources :performance_reviews do 
        member do 
          post :comment
          get :contributers
        end
        # resources :contributers
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
