Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do 
    namespace :v1 do 
      resources :wins, only: [:index]
      resources :users do 
        resources :wins, only: [:create], controller: "user_wins"
      end
    end
  end
    
  mount ActionCable.server => "/cable"
end