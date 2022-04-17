Rails.application.routes.draw do

  root "articles#index"
  get "preinternship/about"

  devise_for :users, controllers: { registrations: "users/registrations" }
  resource :contacts, only: %i[new create]
  resources :articles, only: %i[index show]

  resource :user, only: [] do
    resources :articles, only: %i[index show edit update destroy new create], module: :users
  end
end
