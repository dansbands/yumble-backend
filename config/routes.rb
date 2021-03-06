Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users
      resources :restaurants
      resources :saved_restaurants

      get '/fetch_data', to: 'request#fetch_data'
      post '/auth', to: 'auth#create'
      get '/current_user', to: 'auth#show'

    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
