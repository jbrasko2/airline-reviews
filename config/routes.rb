Rails.application.routes.draw do
  root 'pages#index'

  namespace :api do
    namespace :v1 do
      # use slug instead of id as param for routing
      resources :airlines, param: :slug
      resources :reviews, only: [:create, :destroy]
    end
  end

  # route requests for existing paths back to index path
  get '*path', to: 'pages#index', via: :all
end
