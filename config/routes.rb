Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :parking_places
  resources :time_slots
  resources :reservations
end
