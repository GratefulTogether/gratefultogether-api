Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do 
    namespace :v1 do 
      resources :users do 
        resources :wins, only: [:create]
      end

      resources :wins, only: [:index]
    end
  end
    
  mount ActionCable.server => "/cable"
end