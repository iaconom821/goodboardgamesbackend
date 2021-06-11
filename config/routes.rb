Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do
      resources :reviews
      resources :boardgames
      resources :users

      post "/login", to: "users#login"
      get "/auto_login", to: "users#auto_login"
      # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
      post "/gameowners", to: "gameowners#create"
    end
  end
end
