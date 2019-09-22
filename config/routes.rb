Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'posts#index'
  
  resources :posts do
    get 'create' => 'posts#index'
    get 'update' => 'posts#index'
    get 'destroy' => 'posts#index'

    resources :comments, only: [:create, :edit, :update, :destroy] do
      get 'create' => 'posts#index'
      get 'update' => 'posts#index'
      get 'destroy' => 'posts#index'
    end

    collection do
      get 'search'
      get 'bird'
    end

  end

  resources :users, only: [:show]

end
