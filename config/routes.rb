Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  scope '/api/v1/', defaults: { format: :json } do
    get 'login', to: 'sessions#new', as: 'login'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy', as: 'logout'

    resources :books, only: :index

    resources :words, only: [:index, :show]

    resources :notebooks, only: [:index, :create, :destroy]

    resources :learn_notes, only: :create

    root 'books#index' 
  end
end
