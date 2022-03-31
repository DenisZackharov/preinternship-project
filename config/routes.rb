Rails.application.routes.draw do

  root "preinternship#home"
  get "preinternship/about"
  get "tags/:tag", to: "articles#index", as: :tag

  devise_for :users, controllers: { registrations: "users/registrations" }
  resource :contacts, only: %i[new create]
  resources :articles, only: %i[index show]

  resource :user, only: [] do
    resources :articles, only: %i[index show edit update destroy new create], module: :users do
      resource :publish, only: :update, module: :articles
      resource :draft, only: :update, module: :articles
    end
  end
end
