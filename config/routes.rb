Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :networks, only: [ :index ]
    end
  end

  resources :networks, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
  end

  resources :decoys, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
  end

  resources :decoy_templates, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
  end
end



