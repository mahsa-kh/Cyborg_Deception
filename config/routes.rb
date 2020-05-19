Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :networks, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
  end
end
