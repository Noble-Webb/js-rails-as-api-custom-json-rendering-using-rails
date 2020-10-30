Rails.application.routes.draw do
  resources :birds, only: [:index, :new, :show]
end