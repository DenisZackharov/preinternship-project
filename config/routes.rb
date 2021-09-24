Rails.application.routes.draw do
  root "preinternship#home"
  devise_for :users, controllers: { registrations: "users/registrations" }
  get "preinternship/about"

  resources :articles

  get "/drafted_articles/", to: "articles#index_drafted"

end
