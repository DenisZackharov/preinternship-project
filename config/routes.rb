Rails.application.routes.draw do
  root "preinternship#home"
  devise_for :users, controllers: { registrations: "users/registrations" }
  get "preinternship/about"
  get "preinternship/contact"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
