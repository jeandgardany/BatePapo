Rails.application.routes.draw do
  resources :notifications
  resources :solicitations
  resources :messages
  resources :participantes
  resources :salas
  #get 'salas/:id/solicitacao' => 'salas#show#solicitacao', as: 'solicitacao'
  #post '/sala/:id/solicitacao' => 'salas#show#solicitacao', as: 'solicitacao'
  resources :salas do
  resources :solicitations
  end
  resources :adms
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "salas#index"
  mount ActionCable.server => '/cable'
end
