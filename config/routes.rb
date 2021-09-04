Rails.application.routes.draw do
  root "preinternship#home"
  devise_for :users
  get "preinternship/about"

  resources :articles do
    resources :comments, only: %i[create destroy]
  end

end
