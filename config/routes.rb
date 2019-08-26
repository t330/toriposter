Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'posts#index'
  
  resources :posts do

    resources :comments, only: [:create]

    collection do
      get 'search'
    end

  end

  resources :users, only: [:show]

end
