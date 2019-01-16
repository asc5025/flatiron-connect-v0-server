Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[index update create show destroy]
      resources :conversations, only: %i[index show create] do
        resources :messages, only: %i[index create]
      end
      post '/convos/msg', to: 'conversations#custom'
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get 'user/convos', to: 'users#convos'
    end
  end
end
