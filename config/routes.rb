Rails.application.routes.draw do
  root 'welcome#index'
  # get 'trends/index'
  # get 'trends/show'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  post '/users/:id' => 'users#show', as: :user

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/signup' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  namespace :api do
    namespace :v1 do
    get 'search' => 'trends#search'

      resources :trends do
        resources :videos do
          resources :comment
        end
      end
    end
  end
end
