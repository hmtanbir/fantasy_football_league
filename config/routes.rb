Rails.application.routes.draw do
  root 'home#index'
  get 'standings', to: 'home#standings'
  resources :games
  resources :teams
  resources :game_sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
