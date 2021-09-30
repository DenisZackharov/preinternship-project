Rails.application.routes.draw do

  root "articles#index"
  get "preinternship/about"

  devise_for :users, controllers: { registrations: "users/registrations" }


  resources :articles, only: %i[index show]
  
  resources :users, only: [] do
    resources :articles, module: :users
  end
end
