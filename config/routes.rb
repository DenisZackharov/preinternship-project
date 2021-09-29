Rails.application.routes.draw do

  root "preinternship#home"
  get "preinternship/about"

  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :articles

end
