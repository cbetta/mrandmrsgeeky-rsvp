Rails.application.routes.draw do
  resources :guests, only: [:create, :index]

  root 'guests#new'
end
