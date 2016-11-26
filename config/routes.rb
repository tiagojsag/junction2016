Rails.application.routes.draw do
  resources :parking_places
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :reservations
  resources :time_slots

  resources :parking_places do
    resources :time_slots, only: [:show, :index]

  end
end
