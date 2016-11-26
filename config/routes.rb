Rails.application.routes.draw do
  resources :time_slots
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :parking_places do
    resources :time_slots, only: [:show, :index]

  end
end
