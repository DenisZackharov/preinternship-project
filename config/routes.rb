Rails.application.routes.draw do
  root "preinternship#home"
  devise_for :users, controllers: { registrations: "users/registrations" }
  get "preinternship/about"

  resource :contacts, only: %i[new create]
end
