Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do
      resources :reviews
      resources :boardgames
      resources :users

      post "/login", to: "users#login"
      # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
      post "/gameowners", to: "gameowners#create"
      patch "/gameowners", to: "gameowners#delete"
      post "/scanned_game", to: "boardgames#scanned_game"
    end
  end

  namespace :admin do
    delete "/boardgames/:id", to: "boardgames#destroy"
  end
end
