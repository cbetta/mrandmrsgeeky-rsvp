Rails.application.routes.draw do
  resources :guests, only: [:create]

  root 'guests#new'
end
