Rails.application.routes.draw do

  patch "tickets/:id/" => "tickets#toggle_status", as: :toggle_ticket_status
  devise_for :users
  resources :tickets

  root "tickets#index"

end
