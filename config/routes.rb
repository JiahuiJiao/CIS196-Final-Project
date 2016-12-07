Rails.application.routes.draw do
  resources :requests
  resources :events
  resources :users
  root 'welcome#index'

  # Routes for create session
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # Routes for adding users to events
  get '/users/:id/friends' => 'users#friends'
  post '/event/:id/users' => 'events#add_user'
  delete '/event/:id/users' => 'events#delete_user'

  # Routes for display other's calender
  get '/event/:id/guest/:user_id' => 'events#guest'
  get ':current_id/guestviews/:user_id' => 'users#guest_view'

  # Routes for creating, accepting, declining and showing friends
  post '/requests/new/:current_user_id/:user_id' => 'requests#create'
  post 'requests/:id' => 'requests#accept_request'
  delete '/requests/:id' => 'requests#destroy'
  get '/users/:id/requests' => 'users#view_requests'
  delete ':id/unfriend/:user_id' => 'users#unfriend'
end
