Rails.application.routes.draw do
  resources :messages
  resources :participantes
  resources :salas
  resources :adms
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "salas#index"
  mount ActionCable.server => '/cable'
end
