Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: "users#index"

  resources :meetups, only: [ :new, :create, :show, :edit, :update, :destroy, :index ]
  resources :users, only: [ :show ]
  resources :bookings, only: [ :create, :destroy, :edit, :update, :show]
  get "meetups/:meetup_id/booking/new", to: "bookings#new", as: :new_booking
end
