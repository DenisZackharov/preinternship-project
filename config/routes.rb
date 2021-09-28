Rails.application.routes.draw do
  root "preinternship#home"
  devise_for :users, controllers: { registrations: "users/registrations" }
  get "preinternship/about"

  resources :articles

  resources :drafted_articles, only: %i( index )

end
